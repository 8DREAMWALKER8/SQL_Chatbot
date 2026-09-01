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