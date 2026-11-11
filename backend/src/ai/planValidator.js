    const { semanticLayer } = require("./semanticLayer");

    function validateQueryPlan(queryPlan) {
        const errors = [];

        const metricDefinition =
            semanticLayer.metrics[queryPlan.metric];

        // Metric kontrolü
        if (!queryPlan.metric) {
            errors.push("Query plan içinde metric belirtilmemiş.");
        } else if (!metricDefinition) {
            errors.push(`Bilinmeyen metric: ${queryPlan.metric}`);
        }

        // Dimension kontrolü
        if (queryPlan.dimensions) {

            if (!Array.isArray(queryPlan.dimensions)) {
                errors.push("Dimensions bir array olmalıdır.");
            } else {

                for (const dimension of queryPlan.dimensions) {

                    const dimensionDefinition =
                        semanticLayer.dimensions[dimension];

                    if (!dimensionDefinition) {

                        errors.push(
                            `Bilinmeyen dimension: ${dimension}`
                        );

                    } else if (
                        metricDefinition &&
                        dimensionDefinition.sourceView !==
                            metricDefinition.sourceView
                    ) {

                        errors.push(
                            `Metric "${queryPlan.metric}" ile dimension "${dimension}" aynı sourceView üzerinde değil.`
                        );
                    }
                }
            }
        }

        if(queryPlan.timeGranularity){
        
            if(!semanticLayer.dimensions.time.granularities[queryPlan.timeGranularity]){
            
                errors.push(`Bilinmeyen time granularities: ${queryPlan.timeGranularity}`);
            }
        }
        

        // timeFilter
        /*
        if(queryPlan.timeFilter !== undefined){
            if(queryPlan === null ){
                errors.push( "Time filter null olamaz. " );

            }else if(Array.isArray(queryPlan.timeFilter)){

                errors.push("Time filter dizi olmamalı.");

            }else if(typeof queryPlan.timeFilter !== "object"){

                errors.push(`Time filter object değil: ${queryPlan.timeFilter.type}`);

            }else if(queryPlan.timeFilter.){}
        }
            */

        return {
            valid: errors.length === 0,
            errors
        };
    }

    module.exports = {
        validateQueryPlan
    };