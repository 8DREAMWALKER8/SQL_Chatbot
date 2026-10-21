const semanticLayer = {

    metrics: 
    {
        revenue: 
        {
            description:"satış geliri",
            sourceView:"ai.vw_SalesDetail",
            expression:"SUM(LineTotal)",
            dateColumn:"OrderDate",
            synonyms:["ciro", "gelir", "satış geliri"]
        },
    


    
        orderCount: 
        {
            description:"toplam sipariş sayısı",
            sourceView:"ai.vw_SalesDetail",
            expression:"COUNT(DISTINCT OrderID)",
            dateColumn:"OrderDate",
            synonyms:[
                "sipariş sayısı",
                "kaç sipariş",
                "toplam sipariş"
            ]
        },
    

    
        unitsSold: 
        {
            description:"satılan ürün miktarı",
            sourceView:"ai.vw_SalesDetail",
            expression:"SUM(Quantity)",
            dateColumn:"OrderDate",
            synonyms:[
                "kaç ürün satıldı",
                "satılan ürün adedi",
                "toplam satılan ürün"
            ]
        },
    

    
        averageOrderValue: 
        {
            description:"Siparişlerin ortalama toplam tutarı ",
            sourceView:"ai.vw_CustomerOrders",
            expression:"AVG(TotalPrice)",
            dateColumn:"OrderDate",
            synonyms:[
                 "ortalama sipariş tutarı",
                 "ortalama sepet tutarı",
                 "bir sipariş ortalama ne kadar"
            ]
        },

        averageOrderValue: 
        {
            description:"Siparişlerin ortalama toplam tutarı ",
            sourceView:"ai.vw_CustomerOrders",
            expression:"AVG(TotalPrice)",
            dateColumn:"OrderDate",
            synonyms:[
                 "ortalama sipariş tutarı",
                 "ortalama sepet tutarı",
                 "bir sipariş ortalama ne kadar"
            ]
        },


    },


    dimensions:
    {
        category:
        {
            description:"Sonuçları ürün kategorisine göre gruplar",
            sourceView:"ai.vw_SalesDetail",
            columns:[
                "CategoryID",
                "CategoryName"
            ],
            synonyms:[
                "kategoriye göre",
                "kategori bazında",
                "kategorilere göre"
            ]

        },

        product:
        {
            description:"Sonuçları ürüne göre gruplar",
            sourceView:"ai.vw_SalesDetail",
            columns:[
                "ProductID",
                "ProductName"
                
            ],
            synonyms:[
                "ürüne göre",
                "ürün bazında",
                "hangi ürün",
                "hangi ürünler"

            ]
        },

        customer:
        {
            description: "Sonuçları müşteriye göre gruplar",
            sourceView:"ai.vw_CustomerOrders",
            columns:
            [
                "UserID",
                "FirstName",
                "LastName"
                
            ],
            synonyms:
            [
                "müşteriye göre",
                "müşteri bazında",
                "hangi müşteri",
                "hangi müşteriler",

            ]
        },

        time: {
          description: "Sonuçları zamansal periyotlara göre gruplar",

          synonyms: 
          [
           "zamana göre",
           "zaman bazlı",
           "tarihe göre",
           "tarih bazlı"
          ],

          granularities: {

          day: 
          {
            synonyms: [
                "günlük",
                "güne göre",
                "gün bazında"
            ]
          },

        week: 
        {
            synonyms: 
            [
                "haftalık",
                "haftaya göre",
                "hafta bazında",
                "haftalara göre"
            ]
        },

        month: 
        {
            synonyms: [
                "aylık",
                "aya göre",
                "ay bazında",
                "aylara göre"
            ]
        },

        year: 
        {
            synonyms: [
                "yıllık",
                "yıla göre",
                "yıl bazında",
                "yıllara göre"
            ]
        }
    }
},



    },

};

module.exports = {
    semanticLayer
};