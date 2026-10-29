const {validateQueryPlan} = require("./planValidator");

const validPlan={
    metric:"revenue",
    dimensions:["product"],
    timeGranularity: null,
    timeFilter: {
        type: "relative",
        value: 6,
        unit:"month"
    }
};

const invalidPlan={
    metric: "profit",
    dimensions:["brand"]
};

const validResult =  validateQueryPlan(validPlan);
const invalidResult = validateQueryPlan(invalidPlan);

console.log("Valid Plan:");
console.log(validResult);

console.log("Invalid Plan:")
console.log(invalidResult);