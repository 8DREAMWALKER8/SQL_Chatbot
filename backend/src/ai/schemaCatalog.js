


const schemaCatalog = {
    views: {
        "ai.vw_ProductInventory":{
            description: "Ürün, kategori, fiyat ve stok bilgilerini içerir.",
            columns: [

               {
                name: "ProductID",
                description: "Ürünün benzersiz kimliği"
               },

               {
                name: "ProductName",
                description: "Ürünün adı"
               },

               {
                name:"ProductDescription",
                description: "Ürün açıklaması"
               },

               {
                name: "CategoryID",
                description: "Ürün kategorisinin benzersiz kimliği"
               },

               {
                name: "CategoryName",
                description: "Ürün kategorisinin adı"
               },

               {
                name: "Price",
                description: "Ürünün fiyatı"
               },

               {
                name: "Stock",
                description: "Ürünün stoktaki miktarı"
               },

               {
                name: "IsProductActive",
                description: "Ürünün satışta olup olmadığı"
               },

               {
                name: "AddedListDate",
                description: "Ürünün listeye eklenme zamanı"
               }

            ]
        },

        "ai.vw_SalesDetail":{
            description: "Siparişlerin ürün, kategori, miktar, birim fiyat ve satış tutarı detaylarını içerir.",

            columns: [

            {
                name: "OrderID",
                description:"Siparişin benzersiz kimliği"
            },

            {
                name: "OrderDate",
                description: "Siparişin verildiği tarih"

            },

            {
                name:"OrderStatus",
                description: "Siparişin mevcut durumunu belirtir"
            },

            {
                name: "ShippedDate",
                description: "Siparişin kargoya verilme tarihi"
            },

            {
                name: "ProductID",
                description: "Ürünün benzersiz kimliği"
            },

            {
                name: "ProductName",
                description: "Ürünün adı"
            },

            {
                name: "CategoryID",
                description: "Ürün kategorisinin benzersiz kimliği"
            },

            {
                name: "CategoryName",
                description: "Ürün kategorisinin adı"
            },

            {
                name: "Quantity",
                description: "Ürünün adedi"
            },

            {
                name: "UnitPrice",
                description: "Ürünün birim fiyatı"
            },

            {
                name: "LineTotal",
                description: "Tek bir sipariş kaleminin toplamı; Quantity * UnitPrice"
            }
        ]

        },

        
    }
};

module.exports = {
    schemaCatalog
};