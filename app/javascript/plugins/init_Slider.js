// <--- display slider value --->
var slider = document.getElementById("price_range");
var output = document.getElementById("selected_range");
output.innerHTML = slider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function () {
  output.innerHTML = this.value;
}
