window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(priceInput.value * 0.1));
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = (Math.ceil(priceInput.value - (priceInput.value * 0.1)));
  })
  
});