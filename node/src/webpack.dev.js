const merge = require('webpack-merge');
const webpack = require('webpack');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const common = require('./webpack.common.js');
const BundleTracker = require('webpack-bundle-tracker');
const path = require('path');

module.exports = merge(common, {
    mode: 'development',
    devtool: 'eval-source-map',
    devServer: {
        // for assets not handled by webpack
        contentBase: path.join(__dirname, 'js'),
        public: 'localhost:9101',
        port: 9101,
        host: '0.0.0.0',
        // gzip everything served by dev server, could speed things up a bit
        compress: true,
        headers: {
            "Access-Control-Allow-Origin": "*",
        },
        // HMR
        hot: true,
        watchContentBase: true,
    },
    output: {
        publicPath: 'http://localhost:9101/js/',
        // hotUpdateChunkFilename: 'hot/hot-update.js',
        // hotUpdateMainFilename: 'hot/hot-update.json'
    },
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
                        loader: 'style-loader'
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
    resolve: {
        alias: {
            'react-dom': '@hot-loader/react-dom',
        },
    },
    plugins: [
        new BundleTracker({
            path: __dirname,
            filename: './assets/webpack-stats.json'
        }),
        new webpack.HotModuleReplacementPlugin(),
        // new BundleAnalyzerPlugin({analyzerHost: '0.0.0.0'}),
    ]
});