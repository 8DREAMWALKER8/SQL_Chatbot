
const {semanticLayer} = require("./semanticLayer");

function validateQueryPlan(queryPlan) {

    const errors = [];

    if(!queryPlan.metric){
        errors.push("queryPlan metric belirtilmemiş");
    }
    else if (!semanticLayer.metrics[queryPlan.metric]){
        errors.push(`Bilinmeyen metric: ${queryPlan.metric}`);
    }  

    if(queryPlan.dimensions){
        if(!Array.isArray(queryPlan.dimensions)){
            errors.push("Dimensions bir array olmalıdır");
        }else{
            for (const dimension of queryPlan.dimensions){
                if(!semanticLayer.dimensions[dimension]){
                    errors.push(`Bilinmeyen dimension: ${dimension}`);
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
    validateQueryPlan
};
