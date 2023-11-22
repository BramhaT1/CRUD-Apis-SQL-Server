const { PrismaClient } =require('@prisma/client');
const prisma = new PrismaClient();
const addUser = async (req, res)=>{



   //  res.send("Hellooo It is Add");
    try {
             let name = req.body.name; 
            
             const allUsers = await prisma.InternTesting.create({
                  data: {
                      name : name
                  }
             });
             res.send(allUsers);
    }
    catch(e){
      console.log(e)
          res.send(e)
    }
    
    }

    const getUser=async(req,res)=>{
        const users = await prisma.InternTesting.findMany();
        res.send(users);
    }
    const updateUser=async (req,res)=>{
        const updateUser = await prisma.InternTesting.update({
            where: {
              id: 4,
            },
            data: {
              name: 'udemy',
            },
          })
          res.send(updateUser);
    }
   

    module.exports.user ={addUser,getUser,updateUser};



