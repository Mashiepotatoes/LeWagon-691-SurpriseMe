import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#rating_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
