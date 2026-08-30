/*
chatbot tarafından okunacak güvenli view tablolarını oluşturuyoruz.

passwordHash,ShippingAddress gibi hassas bilgiler gelsin İSTEMİYORUZ.
*/

use eCommerce
GO


/* salesDetail VIEW'ını oluşturuyoruz. */
CREATE OR ALTER VIEW ai.vw_salesDetail
AS

SELECT
    o.OrderID,
    O.OrderDate,
    O.OrderStatus,
    o.ShippedDate,

    p.ProductID,
    P.ProductName,
    
    c.CategoryID,
    c.CategoryName,

    oi.Quantity,
    oi.UnitPrice,

    CAST(
        oi.Quantity * oi.UnitPrice
        AS DECIMAL (18,2)
    ) AS lineTotal

FROM
    Orders AS o  
INNER JOIN 
    dbo.OrderItems AS oi ON o.OrderID = oi.OrderID

INNER JOIN
    dbo.Products AS p ON oi.ProductID = p.ProductID

INNER JOIN 
    dbo.Categories as c  ON p.CategoryID = c.CategoryID;
GO


/* customers VIEW'ını oluşturuoruz. */

CREATE OR ALTER VIEW ai.vw_Customers
AS

SELECT
    UserID,
    FirstName,
    LastName,
    UserRole,
    RegisterDate

FROM
    dbo.Users
GO


/* Product Inventory VIEW'ını oluşturuyoruz. */

CREATE OR ALTER VIEW ai.vw_ProductInventory
AS

SELECT
    p.productID,
    P.ProductName,
    p.ProductDesription,
    
    c.CategoryID,
    c.CategoryName,

    p.Price,
    p.Stock,
    p.IsProductActive,
    p.AddedListDate

FROM 
    dbo.Products AS p  INNER JOIN dbo.Categories AS c  
ON  
    p.CategoryID = c.CategoryID;

GO


/* Customer Orders VIEW'ını oluşturacağız */

CREATE OR ALTER VIEW ai.vw_CustomerOrders
AS

SELECT
    u.UserID,
    u.FirstName,
    u.LastName,

    o.OrderID,
    o.TotalPrice,
    o.OrderStatus,
    o.OrderDate,
    o.ShippedDate

FROM
    dbo.Users AS u INNER JOIN dbo.Orders AS o
ON
    u.UserID = o.UserID;
GO

/* VIEW'LARI KONTROL EDELİM */

SELECT 
    s.name AS SchemaName,
    v.name AS ViewName
FROM
    sys.viewS AS v INNER JOIN sys.schemas as s 
ON
    v.schema_id = s.schema_id
WHERE
    s.name =N'ai'
ORDER BY
    v.name;
GO

