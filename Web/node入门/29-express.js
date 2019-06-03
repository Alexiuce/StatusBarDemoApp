const express = require('express')

const server = express();


server.get((req,rep)=>{
    rep.send("hello").end();
});

server.listen(8080);