/*

Burada kullanacağımız yapay verileri hazırlayacağız.
Boş bir Dataset işimize yaramaz.

*/

USE eCommerce;
GO


IF NOT EXISTS
(
    SELECT 1
    FROM
        dbo.Categories
)
BEGIN

    INSERT INTO dbo.Categories
    (
        CategoryName,
        CategoryDescription
    )

    VALUES
    (N'Elektronik', N'Elektronik ürünler ve aksesuarlar'),
    (N'Bilgisayar', N'Bilgisayar ve bilgisayar bileşenleri'),
    (N'Telefon', N'Akıllı telefon ve mobil cihazlar'),
    (N'Ev Yaşam', N'Ev ve günlük yaşam ürünleri'),
    (N'Kitap', N'Kitap ve eğitim ürünleri'),
    (N'Giyim', N'Giyim ve tekstil ürünleri'),
    (N'Spor', N'Spor ve fitness ürünleri'),
    (N'Ofis', N'Ofis ve çalışma ürünleri');

END;
GO

/* USERS */

IF NOT EXISTS
(
    SELECT 1
    FROM dbo.cenker_Users
)
BEGIN

    INSERT INTO dbo.cenker_Users
    (
        FirstName,
        LastName,
        Email,
        PasswordHash,
        UserRole,
        RegisterDate
    )
    VALUES

    (
        N'Ahmet',
        N'Yılmaz',
        N'ahmet.yilmaz@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-180,SYSDATETIME())
    ),

    (
        N'Zeynep',
        N'Kaya',
        N'zeynep.kaya@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-160,SYSDATETIME())
    ),

    (
        N'Mehmet',
        N'Demir',
        N'mehmet.demir@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-140,SYSDATETIME())
    ),

    (
        N'Elif',
        N'Şahin',
        N'elif.sahin@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-120,SYSDATETIME())
    ),

    (
        N'Can',
        N'Aydın',
        N'can.aydin@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-100,SYSDATETIME())
    ),

    (
        N'Buse',
        N'Çelik',
        N'buse.celik@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-80,SYSDATETIME())
    ),

    (
        N'Mert',
        N'Arslan',
        N'mert.arslan@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-60,SYSDATETIME())
    ),

    (
        N'Aleyna',
        N'Koç',
        N'aleyna.koc@example.com',
        N'DEMO_PASSWORD_HASH_NOT_FOR_PRODUCTION',
        N'user',
        DATEADD(DAY,-40,SYSDATETIME())
    );

END;
GO


/* PRODUCTS */

IF NOT EXISTS
(
    SELECT 1
    FROM dbo.cenker_Products
)
BEGIN

    DECLARE @Elektronik INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Elektronik'
    );

    DECLARE @Bilgisayar INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Bilgisayar'
    );

    DECLARE @Telefon INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Telefon'
    );

    DECLARE @EvYasam INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Ev Yaşam'
    );

    DECLARE @Kitap INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Kitap'
    );

    DECLARE @Giyim INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Giyim'
    );

    DECLARE @Spor INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Spor'
    );

    DECLARE @Ofis INT =
    (
        SELECT CategoryID
        FROM dbo.cenker_Categories
        WHERE CategoryName = N'Ofis'
    );


    INSERT INTO dbo.cenker_Products
    (
        CategoryID,
        ProductName,
        ProductDescription,
        Price,
        Stock
    )
    VALUES

    (@Bilgisayar, N'Laptop Pro 14', N'14 inç performans laptopu', 42999.90, 18),
    (@Bilgisayar, N'Gaming Mouse', N'RGB oyuncu mouse', 1499.90, 65),

    (@Elektronik, N'Kablosuz Kulaklık', N'Bluetooth kulaklık', 2799.90, 42),
    (@Elektronik, N'Akıllı Saat', N'Fitness özellikli akıllı saat', 5299.90, 21),

    (@Telefon, N'Akıllı Telefon X', N'128 GB akıllı telefon', 31999.90, 14),
    (@Telefon, N'USB-C Şarj Cihazı', N'65W hızlı şarj cihazı', 899.90, 77),

    (@EvYasam, N'Kahve Makinesi', N'Otomatik filtre kahve makinesi', 3899.90, 12),
    (@EvYasam, N'Masa Lambası', N'LED çalışma lambası', 799.90, 38),

    (@Kitap, N'SQL Temelleri', N'SQL öğrenme kitabı', 449.90, 55),
    (@Kitap, N'Clean Code', N'Yazılım geliştirme kitabı', 599.90, 31),

    (@Giyim, N'Basic Sweatshirt', N'Pamuklu sweatshirt', 999.90, 44),
    (@Giyim, N'Spor Ayakkabı', N'Günlük spor ayakkabı', 2299.90, 26),

    (@Spor, N'Yoga Matı', N'Kaymaz yoga matı', 649.90, 33),
    (@Spor, N'Dambıl Seti', N'Ev tipi dambıl seti', 1799.90, 17),

    (@Ofis, N'Mekanik Klavye', N'Mekanik ofis klavyesi', 1999.90, 24),
    (@Ofis, N'Ergonomik Mousepad', N'Bilek destekli mousepad', 349.90, 80);

END;
GO

/* ORDERS + ORDER ITEMS */

IF NOT EXISTS
(
    SELECT 1
    FROM dbo.cenker_Orders
)
BEGIN

    DECLARE @Ahmet INT =
    (
        SELECT UserID
        FROM dbo.cenker_Users
        WHERE Email = N'ahmet.yilmaz@example.com'
    );

    DECLARE @Zeynep INT =
    (
        SELECT UserID
        FROM dbo.cenker_Users
        WHERE Email = N'zeynep.kaya@example.com'
    );

    DECLARE @Mehmet INT =
    (
        SELECT UserID
        FROM dbo.cenker_Users
        WHERE Email = N'mehmet.demir@example.com'
    );

    DECLARE @Elif INT =
    (
        SELECT UserID
        FROM dbo.cenker_Users
        WHERE Email = N'elif.sahin@example.com'
    );


    DECLARE @Laptop INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Laptop Pro 14'
    );

    DECLARE @Mouse INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Gaming Mouse'
    );

    DECLARE @Kulaklik INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Kablosuz Kulaklık'
    );

    DECLARE @TelefonProduct INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Akıllı Telefon X'
    );

    DECLARE @SQLBook INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'SQL Temelleri'
    );

    DECLARE @Keyboard INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Mekanik Klavye'
    );

    DECLARE @CoffeeMachine INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Kahve Makinesi'
    );

    DECLARE @Shoes INT =
    (
        SELECT ProductID
        FROM dbo.cenker_Products
        WHERE ProductName = N'Spor Ayakkabı'
    );
