const {getDatabasePool} = require("../config/database");


async function testConnection() {

    try{
        
        const pool = await getDatabasePool();

       console.log("Database bağlantısı test ediliyor...");

        const resultSet = await pool.request().query(
         `SELECT
         DB_NAME() AS DatabaseName,
         USER_NAME() AS DatabaseUser;`
        );

        console.log(resultSet.recordset[0]);
    }

    catch (error) {
    console.error("Database testi başarısız:");
    console.error(error);
}
    
}

testConnection();