const express = require("express");
const authRouter = express.Router(); 
authRouter.post('/api/signup', (req, res) => {
    const { name, email, password } = req.body;
    
     //get dat-post in db-returnt o user
    

});

module.exports =  authRouter;
