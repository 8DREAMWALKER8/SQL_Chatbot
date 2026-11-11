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

const validTimePlan = {
    metric: "revenue",
    dimensions: ["product"],
    timeGranularity: "month"
};

const invalidTimePlan = {
    metric: "revenue",
    dimensions: ["product"],
    timeGranularity: "hour"
};


const validResult = validateQueryPlan(validPlan);
const invalidResult = validateQueryPlan(invalidPlan);
const incompatibleResult = validateQueryPlan(incompatiblePlan);
const validTime = validateQueryPlan(validTimePlan);
const invalidTime = validateQueryPlan (invalidTimePlan)


console.log("VALID PLAN:");
console.log(validResult);

console.log("INVALID PLAN:");
console.log(invalidResult);

console.log("INCOMPATIBLE PLAN:");
console.log(incompatibleResult);

console.log("VALID TIME:");
console.log(validTime);

console.log("INVALID TIME:");
console.log(invalidTime);