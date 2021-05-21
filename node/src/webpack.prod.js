
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
module.exports = (env, argv) => ({
    mode: 'production',
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                include: /js/
            },
            {
                test: /\.(jpe?g|png|gif|svg)$/i, exclude: /node_modules/, loader: "url-loader"
            },
            {
                test: /\.(css)$/, use: [
                    'style-loader',
                    'css-loader'
                ]
            },
            {
                test: /\.(scss)$/, use: [
                    {
                        loader: MiniCssExtractPlugin.loader
                    },
                    {
                        loader: 'css-loader', // translates CSS into CommonJS modules
                    }, {
                        loader: 'postcss-loader', // Run postcss actions
                        options: {
                            plugins: function () { // postcss plugins, can be exported to postcss.config.js
                                return [
                                    require('precss'),
                                    require('autoprefixer')
                                ];
                            }
                        }
                    }, {
                        loader: 'sass-loader' // compiles Sass to CSS
                    }
                ]
            }
        ]
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
        }),
        ]
})
