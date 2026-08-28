
/* Tests */

USE eCommerce;
GO

EXECUTE AS USER = 'chatbot_reader';

SELECT TOP 10 *
FROM ai.vw_SalesDetail;

REVERT;
GO


/* Yetkisiz erişim testi */

EXECUTE AS USER = 'chatbot_reader';

SELECT *
FROM dbo.Users;

REVERT;
GO

PRINT 'CHATBOT_READER KONTROLÜ --- BEKLENEN: VIEW DEĞERLERİ OKUNMALI';

IF EXISTS(
    SELECT 1
    FROM 
        sys.database_principals
    WHERE
        name = N'chatbot_reader' 
)
BEGIN
    PRINT 'PASS : chatbot_reader database kullanıcısı mevcut. ';
END
ELSE
BEGIN
    PRINT 'FAIL: chatbot_reader kullanıcısı bulunamadı.';
END;
GO


/*
Chatbot view okuma testi.
Beklenen sonuç: PASS
*/

BEGIN TRY

    EXECUTE AS USER = 'chatbot_reader';

    SELECT TOP 5
        OrderID,
        OrderDate,
        ProductName,
        CategoryName,
        Quantity,
        UnitPrice,
        LineTotal
    FROM
        ai.vw_SalesDetail

    REVERT ;

    PRINT 'PASS: chatbot_reader ai.vw_SalesDetail okuyabiliyor. ';

END TRY

BEGIN CATCH

        IF USER_NAME() ='chatbot_reader'
            REVERT;

        PRINT 'FAIL: ai.vw_SalesDetail okunamadı.';
        PRINT ERROR_MESSAGE();

END CATCH;
GO

/*
Product Inverntory View.
Beklenen sonuç: PASS
*/

BEGIN TRY 

    EXECUTE AS USER = 'chatbot_reader';

    SELECT TOP 5
        ProductID,
        ProductName,
        CategoryName,
        Price,
        Stock,
        IsProductActive
    FROM
        ai.vw_ProductInventory;

    REVERT;

    PRINT 'PASS: chatbot_reader ai.vw_ProductInventory okuyabiliyor. ';

END TRY

BEGIN CATCH 

    IF USER_NAME() = 'chatbot_reader'
        REVERT;


    PRINT 'FAIL: ai.vw_ProductInverntory chatbot tarafından okunamadı.'
    PRINT ERROR_MESSAGE();

END CATCH;
GO


/*
Test3 -- ai.vw_Customers SELECT
Bu testin çalışması gerekir.
Chatbotumuzun Customers View'ını okuyabilmesini istiyoruz.
*/

BEGIN TRY

    EXECUTE AS USER = 'chatbot_reader';

    SELECT TOP 5
        UserID,
        FirstName,
        LastName,
        UserRole,
        RegisterDate
    FROM
        ai.vw_Customers;

    REVERT;

    PRINT 'PASS: chatbot_reader, ai.vw_Customers okuyabiliyor.';

END TRY

BEGIN CATCH

    IF USER_NAME() = 'chatbot_reader'
      REVERT;

    PRINT 'FAIL: ai.vw_Customers okunamadı.';
    PRINT ERROR_MESSAGE();

END CATCH;
GO


/*
TEST 4 -- dbo.Users direct SELECT
Bu testin 'FAIL' olamsı lazım.
Chatbot ana tabloları okuyamamalı.
Sadece bizim oluşturduğumuz VIEW tablolarını görmesini istiyoruz.
*/

BEGIN TRY

    EXECUTE AS USER = 'chatbot_reader';

    SELECT TOP 1
        UserID,
        Email,
        PasswordHash
    FROM
        Users;

    REVERT;

    PRINT 'FAIL: SECURITY PROBLEM';
    PRINT 'chatbot_reader dbo.Users tablosunu okuyabildi';

END TRY

BEGIN CATCH

    IF USER_NAME() = 'chatbot_reader'
        REVERT;

    PRINT 'PASS: Direct dbo access engellendi.';
    PRINT 'SQL Server Mesajı:';
    PRINT ERROR_MESSAGE();

END CATCH;
GO


/*
TEST 5 -- dbo.Products direct SELECT
Bu testin de 'FAIL' dönemsi gerekiyor. 
chatbot_reader ana tabloları OKUYAMAMALI.
*/

BEGIN TRY

    EXECUTE AS USER = 'chatbot_reader';

    SELECT TOP 1 *
    FROM
        dbo.Products;

    REVERT;

    PRINT 'FAIL: SECURITY PROBLEM!';
    PRINT 'chatbot_reader dbo.Products tablosunu okuyabildi';

END TRY 

BEGIN CATCH 

    IF USER_NAME() = 'chatbot_reader'
        REVERT;

    PRINT 'PASS: Direct dbo access engellendi.';
    PRINT ERROR_MESSAGE();

END CATCH;
GO


/*
TEST 6 -- PERMISSION MATRIX 
Burda veri değiştirmeden kullanıcının yetkilerini sorguluyoruz.
*/

EXECUTE AS USER = 'chatbot_reader';

SELECT
    /* AI */

    HAS_PERMS_BY_NAME(
        'ai.vw_SalesDetail',
        'OBJECT',
        'SELECT'
    )AS CanSelectSalesView,

    HAS_PERMS_BY_NAME(
        'ai.vw_ProdcutInventory',
        'OBJECT',
        'SELECT'
    )AS CanSelectInventoryView,

    HAS_PERMS_BY_NAME(
        'ai.vw_Customers',
        'OBJECT',
        'SELECT'
    )AS CanSelectCustomersView,

    HAS_PERMS_BY_NAME(
        'ai.vw_CustomerOrder',
        'OBJECT',
        'SELECT'
    )AS CanSelectCustomerOrderView,



    /* DBO */

    HAS_PERMS_BY_NAME(
        'dbo.Users',
        'OBJECT',
        'SELECT'
    )AS CanSelectUsersTable,

    HAS_PERMS_BY_NAME(
        'dbo.Products',
        'OBJECT',
        'SELECT'
    )AS CanSelectProductsTable,


    /* WRITE */

    HAS_PERMS_BY_NAME(
        'dbo.Products',
        'OBJECT',
        'SELECT'
    )AS CanInsertProducts,

    HAS_PERMS_BY_NAME(
        'dbo.Products',
        'OBJECT',
        'UPDATE'
    )AS CanUpdateProducts,

    HAS_PERMS_BY_NAME(
        'dbo.Products',
        'OBJECT',
        'DELETE'
    )AS CanDeleteProducts;

REVERT;

GO


/*
TEST 7 -- CURRENT EXPLICIT PERMISSION
*/


SELECT 

    dp.name AS UserName,
    perm.state_desc AS PermissionState,
    perm.permission_name AS PermissionName,
    perm.class_desc AS PermissionClass,

    CASE 
        WHEN perm.class_desc = 'SCHEMA'
        THEN SCHEMA_NAME(perm.major_id)
        ELSE NULL 
    END AS SchemaName 

FROM 
    sys.database_permission AS perm
INNER JOIN
    sys.database_principals AS dp ON perm.grantee_principal_id = dp.principal_id 
WHERE
    dp.name = N'chatbot_reader'
ORDER BY
    PermissionState,
    PermissionName;

GO

PRINT 'SECURITY TEST COMPLETED';
GO





    

