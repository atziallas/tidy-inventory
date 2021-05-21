import React, {useEffect} from 'react';
import Draggable from 'react-draggable';
import close from '../../../images/close.png'
import Quagga from 'quagga'
import {Loader} from "../../search/components/Loader";
import {validateEAN13} from "../utils/utils";

export const ScannerPopup = ({
                                 scannerShown,
                                 scanning,
                                 toggleScanning,
                                 entityExists,
                                 scannedBarcode,
                                 toggleScannerPopup
                             }) => {
    useEffect(() => {
        if (scannerShown) {
            Quagga.init({
                inputStream: {
                    name: "Live",
                    type: "LiveStream",
                    // target: document.querySelector('#scannerPreview')    // Or '#yourElement' (optional)
                },
                decoder: {
                    readers: ["ean_reader"]
                }
            }, function (err) {
                if (err) {
                    console.log(err);
                    return
                }
                console.log("Initialization finished. Ready to start");
                Quagga.start();
                toggleScanning()
            });
        } else if (scanning) {
            Quagga.stop()
            toggleScanning()
        }
        Quagga.onProcessed((result) => {
            var drawingCtx = Quagga.canvas.ctx.overlay,
                drawingCanvas = Quagga.canvas.dom.overlay;

            if (result) {
                if (result.boxes) {
                    drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
                    result.boxes.filter(function (box) {
                        return box !== result.box;
                    }).forEach(function (box) {
                        Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: "green", lineWidth: 2});
                    });
                }

                if (result.box) {
                    const box = result.box
                    Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: "#00F", lineWidth: 2});
                }

                if (result.codeResult && result.codeResult.code) {
                    Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3});
                }
            }
        });

        Quagga.onDetected((result) => {
            var code = result.codeResult.code;
            console.log("detected")
            if (validateEAN13(code)) {
                console.log("success")
                scannedBarcode(code)
            }
        });


    }, [scannerShown])
    return (
        <div className="scannerPopup" style={{display: scannerShown ? 'block' : 'none'}}>
            <Draggable handle=".handle">
                <div className="box no-cursor">
                    <strong className="handle cursor">
                        <div className="looseRow justify-content-between">
                            <div className="col"></div>
                            <div className="col">Scanner</div>
                            <div className="col looseRow justify-content-end mr-1">
                                <div className="col-1 align-self-center"><img src={close} onClick={toggleScannerPopup}/></div>
                            </div>
                        </div>
                    </strong>
                    <div id="interactive" className="viewport">
                    </div>
                    <div className="row align-items-center h-100">
                        <Loader style={{alignSelf: 'center'}}
                                extraClasses={"inline " + (!scanning ? "loading" : "")}
                                width="163px"/>
                    </div>
                </div>
            </Draggable>
        </div>
    )
}