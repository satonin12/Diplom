import 'bootstrap';
import './styles/index.scss'
import libraryLogo from './img/library.png'
import Rellax from 'rellax'

var rellax = new Rellax('.rellax')
var Price = 1500

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min; //Максимум не включается, минимум включается
}

var Prices = {
  col1 : {
    price1: getRandomInt(1, 1500),
    price2: getRandomInt(1, 1500),
    price3: getRandomInt(1, 1500),
    price4: getRandomInt(1, 1500)
  },
  col2 : {
    price1: getRandomInt(1, 1500),
    price2: getRandomInt(1, 1500),
    price3: getRandomInt(1, 1500),
    price4: getRandomInt(1, 1500)
  },
  col3 : {
    price1: getRandomInt(1, 1500),
    price2: getRandomInt(1, 1500),
    price3: getRandomInt(1, 1500),
    price4: getRandomInt(1, 1500)
  },
  col4 : {
    price1: getRandomInt(1, 1500),
    price2: getRandomInt(1, 1500),
    price3: getRandomInt(1, 1500),
    price4: getRandomInt(1, 1500)
  }
}
console.log(Prices)

var selectService = document.getElementById('inputGroupSelect01')
var price = document.getElementById('priceNum')

var list1 = document.getElementById('list-group-item1')
var list2 = document.getElementById('list-group-item2')
var list3 = document.getElementById('list-group-item3')
var list4 = document.getElementById('list-group-item4')

selectService.onchange = e => {
  var text = selectService.options[selectService.selectedIndex].text;
  var value = selectService.options[selectService.selectedIndex].value;
  console.log(value);
  console.log(selectService.options[selectService.selectedIndex].value);
  switch(value){
    case '0' :
      list1.data.addClass('active')
      break;
    case '1' :
      break;
    case '2' :
      break;
    case '3' :
      break;
  }
}
