function display(){
  const priceDisplay = document.getElementById("add-tax-price")
  const priceInput = document.getElementById("item-price")
  const profitSum = document.getElementById("profit")
    priceInput.addEventListener("keyup",()=>{
    price = priceInput.value;
    let tax = Math.round(price / 10)
    priceDisplay.innerHTML = tax
  profitSum.innerHTML = price - tax
  })
}
window.addEventListener("load",display)