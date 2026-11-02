const { semanticLayer } = require("./semanticLayer");

function queryPlanControl(queryPlan)
{
const errors = [];

const metricDefinition = semanticLayer.metrics[queryPlan.metric];
if (!metricDefinition) {
    errors.push(`Bilinmeyen metric: ${queryPlan.metric}`);

    return {
        valid: false,
        errors
    };
}

if (queryPlan.dimensions){
for( const dimension of queryPlan.dimensions)
{
   const dimensionDefinition = semanticLayer.dimensions[dimension];

   if(!dimensionDefinition)
    {
                    errors.push(`Bilinmeyen dimension: ${dimension}`);
    }
    else if(dimensionDefinition.sourceView !== metricDefinition.sourceView)
    {
           errors.push( `Metric "${queryPlan.metric}" ile dimension "${dimension}" aynı sourceView üzerinde değil.`);
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