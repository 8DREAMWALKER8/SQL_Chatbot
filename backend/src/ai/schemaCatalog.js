


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

        "ai.vw_Customers":{
            description: "Müşteri kimliği, adı, rolü ve kayıt tarihi bilgilerini içerir.",

            columns: [

            {
                name: "UserID",
                description:"Müşterinin benzersiz kimliği"
            },

            {
                name: "FirstName",
                description: "Müşterinin ilk adı"

            },

            {
                name:"LastName",
                description: "Müşterinin soyadı"
            },

            {
                name: "UserRole",
                description: "Kullanıcının sistemdeki rolünü belirtir"
            },

            {
                name: "RegisterDate",
                description: "Müşterinin sisteme kayıt olduğu tarih"
            },

           
        ]

        },

        "ai.vw_CustomerOrders":{
            description: "Müşterilerin sipariş kimliği, toplam tutarı, durumu ve tarih bilgilerini içerir.",

            columns: [

            {
                name: "UserID",
                description:"Kullanıcının benzersiz kimliği"
            },

            {
                name: "FirstName",
                description: "Siparişi veren kullanıcının adı"

            },

            {
                name:"LastName",
                description: "Siparişi veren müşterinin soyadı"
            },

            {
                name: "OrderID",
                description: "Siparişin benzersiz kimliği"
            },

            {
                name: "TotalPrice",
                description: "Siparişin toplam tutarı"
            },

            {
                name: "OrderStatus",
                description: "Siparişin durumunu belirtir"
            },

            {
                name: "OrderDate",
                description: "Siparişin verildiği tarih"
            },

            {
                name: "ShippedDate",
                description: "Siparişin kargoya verildiği tarih"
            },

            
        ]

        },


         "ai.vw_CustomerOrders":{
            description: "Müşterilerin sipariş kimliği, toplam tutarı, durumu ve tarih bilgilerini içerir.",

            columns: [

            {
                name: "UserID",
                description:"Kullanıcının benzersiz kimliği"
            },

            {
                name: "FirstName",
                description: "Siparişi veren kullanıcının adı"

            },

            {
                name:"LastName",
                description: "Siparişi veren müşterinin soyadını belirtir"
            },

            {
                name: "OrderID",
                description: "Siparişin benzersiz kimliği"
            },

            {
                name: "TotalPrice",
                description: "Siparişin toplam tutarı"
            },

            {
                name: "OrderStatus",
                description: "Siparişin durumunu belirtir"
            },

            {
                name: "OrderDate",
                description: "Siparişin verildiği tarih"
            },

            {
                name: "ShippedDate",
                description: "Ürünün kargoya verildiği tarih"
            },

            
        ]

        },

        

        
    }
};

module.exports = {
    schemaCatalog
};