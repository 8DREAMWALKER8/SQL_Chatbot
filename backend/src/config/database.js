const sql = require ("mssql");
const env = require("./env");

const databaseConfig = {
    user: env.database.user,    
    password: env.database.password,
    server: env.database.server,
    database: env.database.database,

    options: {
        instanceName: env.database.instance,
        encrypt: true,
        trustServerCertificate: true
    }
}


let pool = null;

async function getDatabasePool(){

    if(pool) {
        
     
        return pool;
    }

    try{
        
        pool = await new sql.ConnectionPool(databaseConfig).connect();
        return pool;
    } catch (error){

        pool=null;
        throw error;

    }

}

module.exports = {
    sql,
    getDatabasePool
};