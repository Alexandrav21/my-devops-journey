const assert = require("node:assert");
const calculateTotal = require("./index");

assert.strictEqual(calculateTotal(25, 3), 75);

console.log("All tests passed.");