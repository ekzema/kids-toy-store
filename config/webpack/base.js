const { webpackConfig, merge } = require("@rails/webpacker")
const { VueLoaderPlugin } = require('vue-loader')
const webpack = require('webpack')

module.exports = merge({
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader'
            },
            {
                test: /\.mjs$/,
                type: "javascript/auto",
            },
            {
                test: /\.(sass|scss|less|css)$/,
                use: ['style-loader', 'css-loader', 'less-loader']
            },
            // {
            //     enforce: 'pre',
            //     test: /\.(vue)$/i,
            //     loader: 'eslint-loader'
            // }
        ]
    },
    plugins: [
        new VueLoaderPlugin(),
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery',
            'window.jQuery': 'jquery'
        })
    ],
    resolve: {
        extensions: ['.css', '.vue']
    }
}, webpackConfig)


