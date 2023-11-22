const express = require('express');
const router = express.Router();

const { user } = require('../API/user.js');

// router.get('/',(req,res)=>{
//     res.send({message:"okay api is workimg"});
// })


router.post('/addUser', user.addUser)
router.get('/getUser', user.getUser)
router.patch('/updateUser', user.updateUser)


module.exports = router;