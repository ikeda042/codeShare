const utils = require('../js/utils');

async function app1() {
  const examResults = await utils.getExamResults();
  console.log(examResults);

  await utils.postToExaminees(examResults);
  await utils.postToExaminers(examResults);
  
  console.log("Successful post")

}

async function app2() {
  let examResults;
  try {
    examResults = await utils.getExamResults();
    console.log(examResults);
  } catch {
    console.log("Failed getting exam")
    return
  }
  try {
  await Promise.all([
    utils.postToExaminees(examResults),
    utils.postToExaminers(examResults)
  ])
  console.log("Successful post")
  } catch {
    console.log("Failed post")
  }
};


// for main.js
exports.app1 = app1;
exports.app2 = app2;