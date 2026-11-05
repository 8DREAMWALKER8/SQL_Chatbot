const { semanticLayer } = require("./semanticLayer");

function queryPlanControl(queryPlan)
{
const errors = [];

let metricDefinition = null;

// metrik kontrolü
if (!queryPlan.metric) {
    errors.push(`Query plan içinde metric belirtilmemiş.`);

} 
else {
    metricDefinition = semanticLayer.metrics[queryPlan.metric];

    if(!metricDefinition){
        errors.push(`Bilinmeyen metric:${queryPlan.metric}`);
    }
}

//dimension kontrolü

if (queryPlan.dimensions !== undefined ){
    if(!Array.isArray( queryPlan.dimensions)){
        errors.push("Dimension bir array olmalıdır.");
    }
    else{
        for( const dimension of queryPlan.dimensions){

            const dimensionDefinition = semanticLayer.dimensions[dimension];

            if(!dimensionDefinition){
                    
                errors.push(`Bilinmeyen dimension: ${dimension}`);
              
                continue;
            }

            if( metricDefinition && dimensionDefinition.sourceView !== metricDefinition.sourceView ){

                errors.push (`Metric "&{queryPlan.metric}" ile dimension "&(dimension)" aynı sourceView üzerinde değil. `);
                
            }
    
        }
    }

}

   
return {
        valid: errors.length === 0,
        errors    
};  
}
module.exports = {
    queryPlanControl
};