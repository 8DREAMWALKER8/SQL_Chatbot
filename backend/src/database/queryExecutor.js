const {getDatabasePool } = require("../config/database");

async function executeQuery(query) {
    try {
        const pool = await getDatabasePool();

        const result =await pool.request().query(query);

        return result.recordset;
    }

    catch (error) {
        console.error(
            "SQL sorgusu çalıştırılırken hata oluştu:",
            error.message
        );

        throw error;

    }
}

module.exports = {
    executeQuery
};