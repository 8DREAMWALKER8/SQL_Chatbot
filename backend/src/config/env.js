const dotenv = require("dotenv");

dotenv.config();

const requiredVariables = [
    "DB_DATABASE",
    "DB_INSTANCE",
    "DB_PASSWORD",
    "DB_SERVER",
    "DB_USER"
]

/*
 for(let i=0; i<requiredVariables.length ; i++)
    if(!process.env[requiredVariables[i]]){
        throw new Error("boş gereksinim:");
        
        
    }
*/

for (const variable of requiredVariables ){
    if(!process.env[variable]){
        throw new Error(`Eksik gereksinim: ${variable}`);
    }
}


const portController = Number(process.env.PORT);


if( portController < 1 || portController > 65535 || Number.isNaN(portController) || !Number.isInteger(portController)){
   
    throw new Error("PORT değeri düzgün girilmemiş. Tam sayı olmasına ve 1 ile 65535 arasında olmasına dikkat edin");
}
    




const env = {
    port:portController,

    database:{
        server: process.env.DB_SERVER,
        instance: process.env.DB_INSTANCE,
        database: process.env.DB_DATABASE,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD
    }
};



module.exports = env;