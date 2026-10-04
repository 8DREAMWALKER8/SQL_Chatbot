/*
    FILE: 06_createIndex.sql

    PURPOSE:
    Analitik sorgular ve JOIN işlemleri için gerekli
    indexleri oluşturur.

    Bu script tekrar çalıştırılabilir.
*/


USE eCommerce;
GO


/* =========================================================
   ORDERS - USER
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'dbo.Orders')
      AND name = N'IX_Orders_UserID'
)
BEGIN

    CREATE INDEX IX_Orders_UserID
    ON dbo.Orders(UserID)

    INCLUDE
    (
        OrderDate,
        OrderStatus,
        TotalPrice
    );

    PRINT 'IX_Orders_UserID oluşturuldu.';

END
ELSE
BEGIN

    PRINT 'IX_Orders_UserID zaten mevcut.';

END;
GO



/* =========================================================
   ORDERS - ORDER DATE
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'dbo.Orders')
      AND name = N'IX_Orders_OrderDate'
)
BEGIN

    CREATE INDEX IX_Orders_OrderDate
    ON dbo.Orders(OrderDate)

    INCLUDE
    (
        UserID,
        OrderStatus,
        TotalPrice,
        ShippedDate
    );

    PRINT 'IX_Orders_OrderDate oluşturuldu.';

END
ELSE
BEGIN

    PRINT 'IX_Orders_OrderDate zaten mevcut.';

END;
GO



/* =========================================================
   ORDER ITEMS - ORDER
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'dbo.OrderItems')
      AND name = N'IX_OrderItems_OrderID'
)
BEGIN

    CREATE INDEX IX_OrderItems_OrderID
    ON dbo.OrderItems(OrderID)

    INCLUDE
    (
        ProductID,
        Quantity,
        UnitPrice
    );

    PRINT 'IX_OrderItems_OrderID oluşturuldu.';

END
ELSE
BEGIN

    PRINT 'IX_OrderItems_OrderID zaten mevcut.';

END;
GO



/* =========================================================
   ORDER ITEMS - PRODUCT
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'dbo.OrderItems')
      AND name = N'IX_OrderItems_ProductID'
)
BEGIN

    CREATE INDEX IX_OrderItems_ProductID
    ON dbo.OrderItems(ProductID)

    INCLUDE
    (
        OrderID,
        Quantity,
        UnitPrice
    );

    PRINT 'IX_OrderItems_ProductID oluşturuldu.';

END
ELSE
BEGIN

    PRINT 'IX_OrderItems_ProductID zaten mevcut.';

END;
GO



/* =========================================================
   PRODUCTS - CATEGORY
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE object_id = OBJECT_ID(N'dbo.Products')
      AND name = N'IX_Products_CategoryID'
)
BEGIN

    CREATE INDEX IX_Products_CategoryID
    ON dbo.Products(CategoryID)

    INCLUDE
    (
        ProductName,
        Price,
        Stock,
        IsProductActive
    );

    PRINT 'IX_Products_CategoryID oluşturuldu.';

END
ELSE
BEGIN

    PRINT 'IX_Products_CategoryID zaten mevcut.';

END;
GO



/* =========================================================
   INDEX KONTROLÜ
   ========================================================= */

SELECT
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType

FROM sys.indexes AS i

WHERE i.object_id IN
(
    OBJECT_ID(N'dbo.Orders'),
    OBJECT_ID(N'dbo.OrderItems'),
    OBJECT_ID(N'dbo.Products')
)

AND i.name IS NOT NULL

ORDER BY
    TableName,
    IndexName;
GO