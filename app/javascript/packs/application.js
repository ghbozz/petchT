import { initStarRating } from "../plugins/init_star_rating";
import { initNewCardForm } from "../plugins/init_new_card_form";
import { initSelect2, initSelector } from "../plugins/init_select2";
import { initSocialIcons } from "../plugins/initSocialIcons";
import { initNavHover, initSticky } from "../plugins";
import { initFilter } from "../plugins/initFilter";
import { initFileInputs } from "../plugins/initFileInputs";
import { initDependentInputs } from "../plugins/initDependentInputs";

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
// require("turbolinks").start()
require("@rails/activestorage").start();
require("channels");
require("plugins/initQuill");

window.$ = $;

document.querySelector(".nav-wrapper") && initNavHover();
// document.querySelector(".card-specs-ratings") && initSticky();

if (document.querySelector(".rating_field")) initStarRating();
if (document.querySelector(".select2")) initSelect2();
if (document.querySelector(".js-example-basic-multiple")) initSelector();
if (document.querySelector("#init_card")) initNewCardForm();
if (document.querySelector(".socials-btns")) initSocialIcons();
if (document.querySelector(".filter-form")) initFilter();
if (document.querySelector(".animal-select")) initDependentInputs();
if (document.querySelector(".file-input")) initFileInputs();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(".section-fields").on('click',"a.remove_fields",function(){
  return confirm("Are you sure ?") ;
});
