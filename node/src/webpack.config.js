const path = require('path');
const webpack = require('webpack');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;
const TerserJSPlugin = require('terser-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const BundleTracker = require('webpack-bundle-tracker');


module.exports = (env, argv) => ({
    mode: 'development',
    optimization: {
        minimizer: [
            new TerserJSPlugin({
                sourceMap: true,
                cache: true,
                parallel: true,
            }),
            new OptimizeCSSAssetsPlugin({})
        ],
    },
    entry: {
        search: path.resolve(__dirname,'./js/search/index.js'),
        transit: path.resolve(__dirname,'./js/transit/index.js')
    },
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: '[name].js',
        // publicPath: '/dist/',
        publicPath: 'http://localhost:9101/dist/',
        // hotUpdateChunkFilename: 'hot/hot-update.js',
        // hotUpdateMainFilename: 'hot/hot-update.json'
    },
    devServer: {
        // for assets not handled by webpack
        // contentBase: path.join(__dirname, 'dist'),
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
    devtool: argv.mode !== 'production' ? 'cheap-module-source-map' : 'source-map',
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
                    // argv.mode !== 'production' ? 'style-loader' : {loader: MiniCssExtractPlugin.loader},
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
    resolve: {
        alias: {
            'react-dom': '@hot-loader/react-dom',
        },
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
        }),
        new BundleTracker({
            path: __dirname,
            filename: './assets/webpack-stats.json'
        }),
        new webpack.HotModuleReplacementPlugin(),
        // new BundleAnalyzerPlugin({analyzerHost: '0.0.0.0'}),
        // argv.mode == "development" ? new webpack.HotModuleReplacementPlugin() : {}
    ]
})
