import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      mode: "range",
      altInput: true,
      altFormat: "j F, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      // maxDate: new Date().fp_incr(14)
      onClose: (selectedDates) => {
        // If only one date is selected, treat it as both start and end
        if (selectedDates.length === 1) {
          const singleDate = flatpickr.formatDate(selectedDates[0], "Y-m-d");
          this.element.value = `${singleDate} to ${singleDate}`;
        }
      }
    })
  }
}
