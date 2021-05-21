const path = require('path');

module.exports = {
    entry: {
        search: './js/search/index.js',
        transit: './js/transit/index.js'
        // search: path.resolve(__dirname,'./js/search/index.js'),
        // transit: path.resolve(__dirname,'./js/transit/index.js')
    },
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: '[name].js',
    }
}
