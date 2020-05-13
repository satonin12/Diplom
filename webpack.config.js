const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
  context: path.resolve(__dirname, 'src'),
  mode: 'development',
  entry: './index.js',
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'dist')
  },
  optimization : {
    splitChunks : {
      chunks: 'all'
    }
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      },
      {
        test: /\.s[ac]ss$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              reloadAll: true
            }
          },
          'css-loader',
          'sass-loader'
        ]
      },
      {
        test: /\.(png|jpg|svg|gif)$/,
        // include: /img/,
        use: ['file-loader']
      },
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './index.html',
      minify: {
        // collapseWhitespace: true
      }
    }),
    new CleanWebpackPlugin(),
    // new CopyWebpackPlugin([
    //   {
    //     from: path.resolve(__dirname, './src/img/library.png'),
    //     to: path.resolve(__dirname, 'dist')
    //   }
    // ]),
    new MiniCssExtractPlugin({
      filename : '[name].css'
    })
  ]
}
