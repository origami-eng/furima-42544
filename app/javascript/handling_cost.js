const handling_cost_rate = 0.1;

function handling_cost (){
  const price  = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const priceValue = Number(price.value);
    const handlingCostValue = priceValue * handling_cost_rate;
    const profitValue = priceValue - handlingCostValue;
    const handlingCost = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    handlingCost.innerHTML = `${Math.floor(handlingCostValue)} `;
    profit.innerHTML = `${Math.floor(profitValue)} `;
  });
};

window.addEventListener('turbo:load', handling_cost);