const { generateSql } = require("./sqlGenerator");

const queryPlan = {
    metric: "revenue",
    dimensions: ["product"]
};

const queryPlanWithoutDimension = {
    metric: "revenue",
    dimensions: []
};



console.log(generateSql(queryPlan));
console.log(generateSql(queryPlanWithoutDimension));


