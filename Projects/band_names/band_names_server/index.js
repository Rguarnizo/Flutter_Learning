const express = require('express');
const path = require('path');

const app = express();

//Path público
const publicPath = path.resolve(__dirname,'public');

app.use(express.static(publicPath));




app.listen(3000,(err)=>{
    if(err) throw new Error(err);

    console.log(`Sevidor corriendo en puerto ${3000}`);
})