// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import swal from 'sweetalert';
import { initSweetalert } from '../plugins/init_sweetalert';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { updatePrice } from '../helper_functions/updatePrice';
import { imageSwapper } from '../helper_functions/imageSwapper';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  imageSwapper();
  updatePrice();
  const options = {enableTime: true, altFormat: "d-m-Y h:i K", altInput: true};
  flatpickr("#booking_start_time", options);
  flatpickr("#booking_end_time", options);
  const submitButton = document.getElementById('book-now');
    initSweetalert('#sweet-alert-demo', {
        title: "Thank you for your booking",
        text: "See your booking on your account page",
      }, (value) => {
        submitButton.click();
      });
  initMapbox();
});
