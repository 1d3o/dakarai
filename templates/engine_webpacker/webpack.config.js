/**
 * Webpack configuration used to compile engine assets and save them for sprockets.
 */

const path = require('path')

module.exports = {
  entry: {
    '<%= @engine_name %>': path.resolve(__dirname, 'app/javascript/<%= @engine_name %>/index.js'),
  },

  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'app/assets/javascripts'),
    library: '<%= @engine_name %>',
    libraryTarget: 'umd'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      }
    ]
  }
}