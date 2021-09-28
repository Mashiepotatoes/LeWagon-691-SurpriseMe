// <--- display slider value --->

const showPrice = (slider, output) => {
  output.innerHTML = slider.value; // Display the default slider value
};

const initSlider = () => {
  const slider = document.getElementById("price_range");
  const output = document.getElementById("selected_range");
  if (slider) {
    showPrice(slider, output);
    slider.addEventListener('change', () => { showPrice(slider, output) });
  }
}


export { initSlider };
