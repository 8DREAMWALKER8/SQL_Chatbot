
const {semanticLayer} = require("./semanticLayer")

function validateQueryPlan(queryPlan) {

    const errors = [];

    if(!queryPlan.metric){
        errors.push("queryPlan metrik belirtilmemiş");
    }
    else if (!semanticLayer.metrics[queryPlan.metric]){
        errors.push(`Bilinmeyen metrik: ${queryPlan.metric}`);
    }  
    
    

    return {
        valid: errors.length === 0,
        errors
    };  
}

module.exports = {
    validateQueryPlan
};
