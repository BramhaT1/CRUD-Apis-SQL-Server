const express = require("express");
// const res = require("express/lib/response");
const router = require("./routes/routes");
const cors = require("cors")
const app= express();
app.use(express.json());
app.use(cors())
app.use('/',router)
// app.get('/',(req,res)=>{
//     res.send("Hello");
// })
app.listen(4000,()=>{
    console.log(`server running at 4000`);
})






