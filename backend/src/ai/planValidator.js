
const {semanticLayer} = require("./semanticLayer")

function validateQueryPlan(queryPlan) {

    const errors = [];

    if(!queryPlan.metric){
        errors.push("queryPlan metrik belirtilmemiş");
    }
    else if (!semanticLayer.metrics[queryPlan.metric]){
        errors.push(`Bilinmeyen metrik: ${queryPlan.metric}`);
    }  

    if(queryPlan.dimensions){
        if(!Array.isArray(queryPlan.dimensions)){
            errors.push("Dimensions bir array olmalıdır");
        }else{
            for (const dimensions of queryPlan.dimensions){
                if(!semanticLayer.dimensions[dimension]){
                    error.push(`Bilinmeyen dimension: ${dimension}`)
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
