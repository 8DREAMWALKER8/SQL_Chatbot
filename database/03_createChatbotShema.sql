/* This file is for creating views to chatbot can see. We dont want to allow chatbot see all of our database. */

USE eCommerce;
GO

IF SCHEMA_ID(N'ai') IS NULL
BEGIN
    EXEC(N'CREATE SCHEMA ai AUTHORIZATION dbo;');
END;
GO