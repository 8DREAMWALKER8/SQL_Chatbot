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
        
        // timeFilter kontrolü
if (queryPlan.timeFilter !== undefined) {

    const timeFilter = queryPlan.timeFilter;

    if (
        timeFilter === null ||
        Array.isArray(timeFilter) ||
        typeof timeFilter !== "object"
    ) {
        errors.push("Time filter bir object olmalıdır.");
    } else {

        // type kontrolü
        if (timeFilter.type !== "relative") {
            errors.push(
                `Desteklenmeyen timeFilter type: ${timeFilter.type}`
            );
        }

        // value kontrolü
        if (
            !Number.isInteger(timeFilter.value) ||
            timeFilter.value <= 0
        ) {
            errors.push(
                "Time filter value pozitif bir tam sayı olmalıdır."
            );
        }

        // unit kontrolü
        if (
            !semanticLayer.dimensions.time.granularities[
                timeFilter.unit
            ]
        ) {
            errors.push(
                `Bilinmeyen timeFilter unit: ${timeFilter.unit}`
            );
        }
    }
}
            

        return {
            valid: errors.length === 0,
            errors
        };
    }

    module.exports = {
        validateQueryPlan
    };