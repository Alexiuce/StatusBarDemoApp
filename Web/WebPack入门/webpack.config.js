module.exports = {
     entry: "./main.js" ,    // 指定打包入口文件
    output:{
         path:  __dirname + "打包输出的相对(相对与webpack.config.js)路径",
         filename:"打包后的文件名"
    }
    }