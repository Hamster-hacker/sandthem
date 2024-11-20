// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

document.addEventListener("turbo:load", () => {
  flatpickr(".datepicker", {
    mode: "range",
    dateFormat: "d-m-Y",
    altInput: true,
    altFormat: "F j, Y",
    minDate: "today",
    maxDate: new Date().fp_incr(365)
  });
});
