/* 
Chatbot için ayrı SQL Server login oluşturur
eCommerce veritabanında kullanıcı oluşturur
Sadece ai schema'sına SELECT yetkisi verir
Yazma yetkilerini engeller
Tüm veritabanına erişemeyecek.
Böylece zararlı sorgu yazanalar kritik verileri okuyamayacak.
*/


IF NOT EXISTS
(
    SELECT 1
    FROM sys.server_principals
    WHERE name = N'chatbot_reader'
)
BEGIN

    CREATE LOGIN chatbot_reader
    WITH PASSWORD = 'CHANGE_ME_STRONG_PASSWORD!',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

END;
GO


/* dataBase  */

USE eCommerce;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.database_principals
    WHERE name = N'chatbot_reader'
)
BEGIN

    CREATE USER chatbot_reader
    FOR LOGIN chatbot_reader;

END;
GO

/* aiSchema okuma yetkisi veriyoruz*/

GRANT SELECT
ON SCHEMA::ai
TO chatbot_reader;
GO


/* aiSchema üzerinde yazmayı engelliyoruz. Böylece zaralı  promtların önüne geçeriz */

DENY INSERT
ON SCHEMA::ai
TO chatbot_reader;
GO

DENY UPDATE
ON SCHEMA::ai
TO chatbot_reader;
GO

DENY DELETE
ON SCHEMA::ai
TO chatbot_reader;
GO


/* dboSchema üzerine yazmayı engelliyoruz. */

DENY INSERT
ON SCHEMA::dbo
TO chatbot_reader;
GO

DENY UPDATE
ON SCHEMA::dbo
TO chatbot_reader;
GO

DENY DELETE
ON SCHEMA::dbo
TO chatbot_reader;
GO


/*
dboSchema okuma yetkisini tamamen engelliyoruz. 
Burası tüm database bilgilerini içerdiği için burayı okumasını istemiyoruz
SELECT yetkisini engelliyoruz o yüzden.
*/

DENY SELECT
ON SCHEMA::dbo
TO chatbot_reader;
GO


/*
Yetki kontrolü
*/

SELECT 
    dp.Name AS UserName,
    perm.state_desc AS PermissionState,
    perm.permission_name AS PermissionNaem,
    perm.class_desc AS PermissionClass
FROM
    sys.database_permission AS perm 
INNER JOIN
    sys.database_principals as dp ON prem.grantee_principal_id = dp.principal_id
WHERE
    dp.name =N'chatbot_reader'
ORDER BY
    perm.state_desc,
    perm.permission_name;
GO