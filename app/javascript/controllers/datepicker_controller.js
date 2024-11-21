import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      mode: "range",
      altInput: true,
      altFormat: "j M, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      // maxDate: new Date().fp_incr(14)
      onClose: (selectedDates) => {
        if (selectedDates.length === 2) {
          // Format and set both dates only when start and end dates are selected
          const formattedStart = flatpickr.formatDate(selectedDates[0], "j M, Y");
          const formattedEnd = flatpickr.formatDate(selectedDates[1], "j M, Y");
          this.element.value = `${formattedStart} to ${formattedEnd}`;
          this.element.dispatchEvent(new Event("change")); // Trigger the `change` event for the Price controller
        }
      },
    });
  }
}
