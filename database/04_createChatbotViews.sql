/*
chatbot tarafından okunacak güvenli view tablolarını oluşturuyoruz.

passwordHash,ShippingAddress gibi hassas bilgiler gelsin İSTEMİYORUZ.
*/

use eCommerce
GO

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