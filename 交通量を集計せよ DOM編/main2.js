const counters = {
  walker: 0,
  car: 0,
  bike: 0
};

function setupCounter(type) {
  const counterElement = document.getElementById(`${type}-counter`);
  const buttonElement =  document.getElementById(`${type}-button`);
  buttonElement.addEventListener("click", () => {
    counters[type] ++ ;
    counterElement.textContent = counters[type];
  })
};

["walker", "car", "bike"].forEach(setupCounter);

document.getElementById("reset-button").addEventListener("click", () => {
  for (const key in counters){
    counters[key] = 0;
    document.getElementById(`${key}-counter`).textContent = 0;
  }
})
