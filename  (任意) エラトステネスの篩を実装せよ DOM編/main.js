
const checkBox2 = document.getElementById("divisible2");
const checkBox3 = document.getElementById("divisible3");
const checkBox5 = document.getElementById("divisible5");

const resetBtn = document.getElementById("reset");
const initBtn = document.getElementById("init");
const clearBtn = document.getElementById("clear");

resetBtn.addEventListener("click",onClickReset);
initBtn.addEventListener("click",onClickInit);
clearBtn.addEventListener("click",onClickClear);

checkBox2.addEventListener("change",onClickCheck2);
checkBox3.addEventListener("change",onClickCheck3);
checkBox5.addEventListener("change",onClickCheck5);

function onClickInit(){
  checkBox2.checked = false;
  checkBox3.checked = false;
  checkBox5.checked = false;
  initBtn.disabled = true;

  const parent = document.getElementById("numbers");
  const table = document.createElement("table");
  parent.appendChild(table);
  for (let i = 0 ; i < 5; i++){
    const tr = document.createElement("tr");
    for (let j = 1; j < 11; j++){
      const td = document.createElement("td")
      const dataNum = (10 * i + j);
      td.textContent = dataNum.toString();
      td.setAttribute("data-num",dataNum);
      tr.appendChild(td);
    }
    table.appendChild(tr);
  }
  parent.appendChild(table);
}

function onClickClear(){
  checkBox2.checked = false;
  checkBox3.checked = false;
  checkBox5.checked = false;

  const allCells = document.querySelectorAll("td");
  for (let cell of allCells){
      cell.className = "";
  }
}

function onClickReset(){
  checkBox2.checked = false;
  checkBox3.checked = false;
  checkBox5.checked = false;
  initBtn.disabled = false;
  const parent = document.getElementById("numbers");
  parent.innerHTML = "";
}

function onClickCheck2(){
  const allCells = document.querySelectorAll("td");
  for (let cell of allCells){
    if (cell.dataset.num % 2 === 0 ){
      cell.classList.toggle("divisible2");
    }
  }
}

function onClickCheck3(){
  const allCells = document.querySelectorAll("td");
  for (let cell of allCells){
    if (cell.dataset.num % 3 === 0 ){
      cell.classList.toggle("divisible3");
    }
  }
}


function onClickCheck5(){
  const allCells = document.querySelectorAll("td");
  for (let cell of allCells){
    if (cell.dataset.num % 5 === 0 ){
      cell.classList.toggle("divisible5");
    }
  }
}




