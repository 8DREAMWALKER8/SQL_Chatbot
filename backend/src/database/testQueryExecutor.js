const {executeQuery} = require ("./queryExecutor");

async function testQuery() {

    try {
        const rows = await executeQuery( 
    `
        SELECT TOP 5
        ProductID,
        ProductName
        FROM ai.vw_ProductInventory;
            `);

        console.log("[PASS] ai.vw_ProductInventory okunabiliyor.");
        console.log(rows[0]);
    }

    catch (error) {

      
            console.log("[FAIL] ai.vw_ProductInventory okunamadı.");
            console.error(error.message);
    }

    try {
        const rows = await executeQuery(`SELECT TOP 5
             ProductID,
             ProductName
            FROM dbo.Products;
            `);

       
        console.log("[FAIL] dbo.Products okunabildi!");
        console.log(rows[0]);
    }

    catch (error) {

        
            console.log("[PASS] dbo.Products erişimi engellendi.");
            console.error(error.message);
    }
    
}

testQuery();