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
walkerBtn.addEventListener("click",onClickCallback1)

const carBtn = document.getElementById("car-button");
carBtn.addEventListener("click",onClickCallback2)

const bikeBtn = document.getElementById("bike-button");
bikeBtn.addEventListener("click",onClickCallback3)

const reset = document.getElementById("reset-button");
reset.addEventListener("click",onClickCallback4);

function onClickCallback1(){
  walker ++;
  walkerCounter.textContent = walker;
}

function onClickCallback2(){
  car ++;
  carCounter.textContent = car;
}

function onClickCallback3(){
  bike ++;
  bikeCounter.textContent = bike;
}

function onClickCallback4(){
  walker = 0;
  car = 0;
  bike = 0;
  walkerCounter.textContent = 0;
  carCounter.textContent = 0;
  bikeCounter.textContent = 0
}