var path = require('path');

module.exports = {
    entry: {
      "/dualListBox/dualListBox": path.join(__dirname, 'srcjs', 'dualListBox.jsx')
    },
    output: {
        path: path.join(__dirname, 'inst/www/reactwidgets'),
        filename: '[name].js'
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/preset-env', '@babel/preset-react']
                }
            },
            // For CSS so that import "path/style.css"; works
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader']
            }
        ]
    },
    externals: {
        'react': 'window.React',
        'react-dom': 'window.ReactDOM',
        'reactR': 'window.reactR'
    },
    stats: {
        colors: true
    },
    devtool: 'source-map'
};
