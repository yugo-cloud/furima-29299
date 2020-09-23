console.log("check")
function display(){
  const priceDisplay = document.getElementById("add-tax-price")
  const priceInput = document.getElementById("item-price")
  const profitSum = document.getElementById("profit")
  priceInput.addEventListener("keyup",function(price){
    price = priceInput.nodeValue;
    let tax = Math.round(price / 10)
    priceDisplay.innerHTML = tax
  profitSum.innerHTML = price - tax
  })
}
window.addEventListener("load",display)