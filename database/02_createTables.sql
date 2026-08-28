USE eCommerce;
GO

CREATE TABLE dbo.Users 
(
    UserID INT IDENTITY(1,1) NOT NULL,
    FirstName NVARCHAR(50)  NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(80) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    UserRole NVARCHAR(20) NOT NULL,
    RegisterDate DATETIME2 NOT NULL,

    CONSTRAINT  DF_Users_UserRole
        DEFAULT N'user',

    CONSTRAINT DF_Users_RegisterDate
        DEFAULT SYSDATETIME(),

    CONSTRAINT PK_Users
        PRIMARY KEY (UserID),

    CONSTRAINT UQ_Users_Email
        UNIQUE (email)

);

CREATE TABLE dbo.Categories
(
    CategoryID INT IDENTITY(1,1) NOT NULL,
    CategoryName NVARCHAR(100) NOT NULL,
    CategoryDescription NVARCHAR(500) NULL,

    CONSTRAINT PK_Categories
        PRIMARY KEY (CategoryID),

    CONSTRAINT UQ_Categories_CategoryName
        UNIQUE (CategoryName)

);

CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) NOT NULL,
    
    CategoryID INT NOT NULL,
    
    ProductName NVARCHAR(150) NOT NULL,
    
    ProductDescription NVARCHAR(1000) NULL,
    
    Price DECIMAL(18,2) NOT NULL,
    
    Stock 
     INT 
     NOT NULL 
     CONSTRAINT DF_Products_Stock
        DEFAULT 0,

    IsProductActive 
     TINYINT 
     NOT NULL
     CONSTRAINT DF_Products_IsProductActive
        DEFAULT 1,
    
    AddedListDate 
     DATETIME2 
     NOT NULL
     CONSTRAINT DF_Products_AddedListDate
        DEFAULT SYSDATETIME(),

    CONSTRAINT PK_Products
        PRIMARY KEY (ProductID),

    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES dbo.Categories(CategoryID),

    CONSTRAINT CK_Products_Price 
        CHECK (Price>=0),

    CONSTRAINT CK_Products_Stock
        CHECK (Stock >= 0),

);


CREATE TABLE Orders
(

    OrderID INT IDENTITY(1,1) NOT NULL,

    UserID INT NOT NULL,

    TotalPrice DECIMAL(18,2) NOT NULL,

    OrderStatus 
        NVARCHAR(30)
        NOT NULL
        CONSTRAINT DF_Orders_OrderStatus
            DEFAULT N'Pending',

    ShippingAddress NVARCHAR(500) NOT NULL,

    OrderDate 
        DATETIME2
        NOT NULL
        CONSTRAINT DF_Orders_OrderDate
            DEFAULT SYSDATETIME(),

    ShippedDate DATETIME2 NULL,

    CONSTRAINT PK_Orders
        PRIMARY KEY (OrderID),

    CONSTRAINT FK_Orders_Users
        FOREIGN KEY (UserID)
        REFERENCES dbo.Users(UserID),

    CONSTRAINT CK_Orders_ShippedDate
        CHECK(
            ShippedDate IS NULL
            OR
            ShippedDate >= OrderDate
        )

);


CREATE TABLE dbo.OrderItems
(

    OrderItemID INT IDENTITY(1,1) NOT NULL,

    OrderID INT NOT NULL,

    ProductID INT NOT NULL,
    
    Quantity INT NOT NULL,

    UnitPrice DECIMAL(18,2) NOT NULL,

    CONSTRAINT PK_OrderItems
        PRIMARY KEY (OrderItemsID),

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID),

    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Products (ProductID),

    CONSTRAINT CK_OrderItems_Quantity
        CHECK (Quantity > 0),

    CONSTRAINT CK_OrderItems_UnitPrice
        CHECK (UnitPrice >= 0)

);