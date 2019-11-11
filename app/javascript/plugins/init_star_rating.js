import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('.rating_field').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
