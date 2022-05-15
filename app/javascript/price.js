window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const add = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = add
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = Math.floor(inputValue - add)
  })
});