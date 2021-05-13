function count(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputPrice = itemPrice.value;
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = `${inputPrice * 0.1}`;
    const profitPrice = document.getElementById("profit")
    profitPrice.innerHTML =`${inputPrice * 0.9}`
  });
}

window.addEventListener('load', count);
