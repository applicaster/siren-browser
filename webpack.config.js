var webpack = require("webpack");
module.exports = {
    entry: "./src/main.js",
    resolve: {
        modulesDirectories: ["web_modules", "node_modules", "bower_components"]
    },
    devtool: "#source-map",
    plugins: [
        new webpack.optimize.UglifyJsPlugin()
    ],
    output: {
        path: "./dist",
        filename: "bundle.js"
    },
    module: {
        loaders: [
             { test: /\.jade$/, loader: "jade" },
             { test: /\.coffee$/, loader: 'coffee-loader' }

        ]
    }
};
