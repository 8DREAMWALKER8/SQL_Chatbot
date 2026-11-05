const { validateQueryPlan } = require("./planValidator");

const validPlan = {
    metric: "revenue",
    dimensions: ["product"]
};

const invalidPlan = {
    metric: "profit",
    dimensions: ["brand"]
};

const incompatiblePlan = {
    metric: "averageOrderValue",
    dimensions: ["product"]
};


const validResult = validateQueryPlan(validPlan);
const invalidResult = validateQueryPlan(invalidPlan);
const incompatibleResult = validateQueryPlan(incompatiblePlan);


console.log("VALID PLAN:");
console.log(validResult);

console.log("INVALID PLAN:");
console.log(invalidResult);

console.log("INCOMPATIBLE PLAN:");
console.log(incompatibleResult);