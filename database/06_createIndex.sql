/* 

Burda performas için gerekli index'lerimiz bulunacak.
Analitik sorgu ve join işlemlerinin performansı iyileştirilecek

*/


USE eCommerce
GO

/*Orders - User*/

IF NOT EXISTS
(
    SELECT 1
    FROM
        sys.indexes
    WHERE
        Object_id = OBJECT_ID(N'dbo.Orders')
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

    PRINT 'IX_Orders_UserID oluşturuldu'

END;
GO


/* Orders - Date */

IF NOT EXISTS
(
    SELECT
        1
    FROM
        sys.indexes
    WHERE
        object_id = OBJECT_ID(N'dbo.Orders')
    AND name = N'IX_Orders_Orderdate'
    
)

BEGIN

CREATE INDEX IX_Orders_Orderdate
ON dbo.Orders(OrderDate)

INCLUDE
(
    UserID,
    OrderStatus,
    TotalPrice,
    ShippedDate
);

PRINT 'IX_Orders_OrderDate oluşturuldu.'

END;
GO

/* OrderItems - Order */

IF NOT EXISTS
(
    SELECT 1
    FROM    
        sys.indexes
    WHERE 
        object_id = OBJECT_ID (N'dbo.OrderItems')
    AND 
        name = N'IX_OrderItems_OrderID'
)
BEGIN

    CREATE INDEX IX_OrderItems_OrderID
    ON dbo.OrderItems(OrderID)

    INCLUDE
    (
        ProductID,
        Quantitiy,
        UnitPrice
    );

    PRINT 'IX_OrderItems_OrderID oluşturuldu.'

END;
GO


/* OrderItems - Products */
IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE
        object_id = OBJECT_ID (N'dbo.OrderItems')
        AND name = N'IX_OrderItems_ProductID'
)
BEGIN

    CREATE INDEX IX_OrderItems_ProductID
    ON dbo.OrderItems(ProductID)

    INCLUDE
    (
        OrderID,
        Quantitiy,
        UnitPrice
    );

    PRINT ('IX_OrderItems_ProductID oluşturuldu.')

END;
GO


/* Products - Category */
IF NOT EXISTS
(
    SELECT 1
    FROM
        sys.indexes
    WHERE
        object_id = OBJECT_ID (N'IX_Products_CategoryID')
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

    PRINT 'IX_Products_CategoryID oluşturuldu.'

END;
GO


/* INDEX KONTROLÜ */


SELECT
    OBJECT_NAME (i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType

FROM sys.indexes AS i  

WHERE 
    i.object_id IN  
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