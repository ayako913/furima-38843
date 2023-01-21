function priceBuy(){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const commission = 0.1;
    const salesTax = document.getElementById("add-tax-price");
    salesTax.innerHTML = Math.floor(price.value * commission);
    const profit = document.getElementById("profit");
    profit.innerHTML = price.value - Math.floor(price.value * commission);
  });
};
window.addEventListener('load', priceBuy);
