import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#rating_rating').barrating({
    theme: 'css-stars'
    // , onSelect: (value, text, event) => {
    //   const form = $("form.rating_form"); // We are selecting the form on the page with its class
    //   form.submit(); // We submit the form with javascript
    // }
  });
};

export { initStarRating };
