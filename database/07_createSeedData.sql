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
