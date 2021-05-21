module.exports = function (api) {
    api.cache(true);

    const presets = [
        ["@babel/preset-env" ,
        {
            targets: {// this fixes generator debug
                node: "10"
            }
        }],
        "@babel/preset-react",
    ]

    const plugins = [
        "react-hot-loader/babel",
        // "@babel/transform-runtime" // this messes generator debug
    ]
    return {
        presets,
        plugins
    };
}