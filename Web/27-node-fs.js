//  引入node中的fs库
const fs = require('fs')
// 读取文件: 此方法为异步,
fs.readFile("27-test.txt",(err,data)=>{
    console.log(data.toString());
})