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


const validTimeFilterPlan = {
    metric: "revenue",
    dimensions: ["product"],
    timeFilter: {
        type: "relative",
        value: 6,
        unit: "month"
    }
};

const invalidTimeFilterPlan1 = {
    metric: "revenue",
    dimensions: ["product"],
    timeFilter: {
        type: "relative",
        value: -3,
        unit: "century"
    }
};

const invalidTimeFilterPlan2 = {
    metric: "revenue",
    dimensions: ["product"],
    timeFilter: {
        type: "relative",
        value: 0,
        unit: "century"
    }
};

const invalidTimeFilterPlan3 = {
    metric: "revenue",
    dimensions: ["product"],
    timeFilter: {
        type: "relative",
        value: 0,
        unit: "day"
    }
};

const invalidTimeFilterPlan4 = {
    metric: "abc",
    dimensions: ["product"],
    timeFilter: {
        type: "relative",
        value: 3,
        unit: "week"
    }
};

const validResult = validateQueryPlan(validPlan);
const invalidResult = validateQueryPlan(invalidPlan);
const incompatibleResult = validateQueryPlan(incompatiblePlan);
const validTime = validateQueryPlan(validTimePlan);
const invalidTime = validateQueryPlan (invalidTimePlan);
const invalidTimeFilter1 = validateQueryPlan (invalidTimeFilterPlan1);
const invalidTimeFilter2 = validateQueryPlan (invalidTimeFilterPlan2);
const invalidTimeFilter3 = validateQueryPlan (invalidTimeFilterPlan3);
const invalidTimeFilter4 = validateQueryPlan (invalidTimeFilterPlan4);
const validTimeFilter = validateQueryPlan (validTimeFilterPlan);


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

console.log("INVALID TIME FILTER1:");
console.log(invalidTimeFilter1);

console.log("INVALID TIME FILTER2:");
console.log(invalidTimeFilter2);

console.log("INVALID TIME FILTER3:");
console.log(invalidTimeFilter3);

console.log("INVALID TIME FILTER4:");
console.log(invalidTimeFilter4);

console.log("VALID TIME FILTER:");
console.log(validTimeFilter);