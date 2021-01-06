const {io} = require('../index');

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
);