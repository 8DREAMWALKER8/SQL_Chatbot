/* This file is for creating views to chatbot can see. We dont want to allow chatbot see all of our database. */

USE eCommerce;
GO

IF SCHEMA_ID(N'ai') IS NULL
BEGIN
    EXEC(N'CREATE SCHEMA ai AUTHORIZATION dbo;');

    PRINT 'ai Schema oluşturuldu.';

END;

ELSE
BEGIN
    PRINT 'ai schema oluşturulamadı.';
END;
GO

SELECT
    name AS SchemaName,
    schema_id AS SchemaID,
    USER_NAME(principal_id) AS SchemaOwner
FROM
    sys.schemas
WHERE 
    name = N'ai';
GO