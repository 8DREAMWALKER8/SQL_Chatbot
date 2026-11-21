const {semanticLayer} =require("./semanticLayer");

function generateSql(queryPlan){
    const metricDefinition = semanticLayer.metrics[queryPlan.metric];
 

    const dimensionColumns = [];

    if(queryPlan.dimensions){
    
        for (const dimension of queryPlan.dimensions){
         const dimensionDefinition = semanticLayer.dimensions[dimension];

         dimensionColumns.push(...dimensionDefinition.columns);

        }
    }



    const dimensionSelect = dimensionColumns.join(", ");
    const selectDimension = dimensionColumns.length>0 ? `${dimensionSelect},` : "";
    const groupByClause = dimensionColumns.length > 0 ? `GROUP BY ${dimensionSelect}` : "";

    let whereClause = "";

    if(queryPlan.timeFilter){
        
        const timeFilter = queryPlan.timeFilter;
        const timeDefinition =
    }

    const sql = `
    SELECT 
        ${selectDimension}
        ${metricDefinition.expression} AS ${queryPlan.metric}
    FROM ${metricDefinition.sourceView}
    ${whereClause}
    ${groupByClause};
    `;
 
    return sql;

}

module.exports = {
    generateSql
};