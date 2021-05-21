import React from 'react'
import "../../../scss/_loader.scss"

export const Loader = ({width,height,extraClasses}) =>
    (
        <div className={"loader loader6 " + extraClasses}>
            <svg className="svgBlock" width={width} height={height} viewBox="0 0 38 10">
                <circle fill="#3A3A3A" cx="4" cy="5" r="4" />
                <circle fill="#3A3A3A" cx="19" cy="5" r="4" />
                <circle fill="#3A3A3A" cx="34" cy="5" r="4" />
            </svg>
        </div>
    )