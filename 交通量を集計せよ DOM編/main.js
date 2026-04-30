let walker = 0;
let car = 0;
let bike = 0;

function getElementById(elementID){
 return document.getElementById(elementID);
}

const walkerCounter = getElementById("walker-counter")
const carCounter = getElementById("car-counter")
const bikeCounter = getElementById("bike-counter")

const walkerBtn = document.getElementById("walker-button");
walkerBtn.addEventListener("click",() => {
  walker ++;
  walkerCounter?.textContent = walker;
})

const carBtn = document.getElementById("car-button");
carBtn.addEventListener("click",() => {
  car ++;
  carCounter?.textContent = car;
})

const bikeBtn = document.getElementById("bike-button");
bikeBtn.addEventListener("click",() => {
  bike ++;
  bikeCounter?.textContent = bike;
}
)

const reset = document.getElementById("reset-button");
reset.addEventListener("click",() => {
  walker = 0;
  car = 0;
  bike = 0;
  walkerCounter?.textContent = 0;
  carCounter?.textContent = 0;
  bikeCounter?.textContent = 0
});


