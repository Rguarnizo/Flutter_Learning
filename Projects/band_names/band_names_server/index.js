const express = require('express');
const path = require('path');
require('dotenv').config();




const app = express();

//?Path público
const publicPath = path.resolve(__dirname,'public');
app.use(express.static(publicPath));

//?Node Server.
const server = require('http').createServer(app);
const io = require('socket.io')(server);

//? Mensajes de Sockets.
io.on('connection',client =>{
    console.log('Cliente conectado.')

    client.on('disconnect', ()=>{
        console.log('Cliente desconectado.')
    });

    client.on('mensaje',(mensaje)=>{
        console.log(mensaje);
        io.emit('mensaje',{admin:'Nuevo mensaje'});
    })
}
)





server.listen(process.env.PORT,(err)=>{
    if(err) throw new Error(err);

    console.log(`Sevidor corriendo en puerto ${process.env.PORT}`);
})