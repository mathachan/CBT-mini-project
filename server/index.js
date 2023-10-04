//import from packages
const express = require('express');
const mongoose = require('mongoose');

//import from other files
const authRouter = require('./routes/auth');
//init
const PORT = 3000;
const app = express();
//middleware
//client-middelware-server-client
app.use(authRouter);



//creating API - CRUD

mongoose
    .connect()
    .then(() => {
        console.log('COnnection succesful');
    })
    .catch((e) => {
    console.log(e);

});

app.listen(PORT, "0.0.0.0", function () {
    console.log('connected at port ' + PORT);
});
