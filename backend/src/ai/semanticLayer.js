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
            description:"Kategori bazında listeler",
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

        }

    },

};

module.exports = {
    semanticLayer
};