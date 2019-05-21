// 导入node.js http模块
const http = require('http');
// 创建http server 对象;
const server = http.createServer((req,res)=>{
    console.log("server start.....");
});
// 启动server 监听端口;
server.listen(8080);