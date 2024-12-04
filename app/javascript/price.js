const price = () => {
  const priceInput = document.getElementById("item-price"); 
  const addTaxDom = document.getElementById("add-tax-price"); 
  const profitDom = document.getElementById("profit"); 

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseInt(priceInput.value, 10);
      if (!isNaN(inputValue) && inputValue >= 300 && inputValue <= 9999999) {
        const tax = Math.floor(inputValue * 0.1);
        const profit = inputValue - tax;
        addTaxDom.innerHTML = tax;
        profitDom.innerHTML = profit;
      } else {
        addTaxDom.innerHTML = "";
        profitDom.innerHTML = "";
      }
    });
  }
}; 

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);