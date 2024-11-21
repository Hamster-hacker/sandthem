import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static values = {price: Number}
  static targets = ['dates', 'result', 'bookBtn']

  connect() {
    console.log('hello from price controller');
    console.log(this.priceValue)
    this.difference = 0;
  }

  calculate(){
    console.log('hello from calculate', this.datesTarget.value);
    const dateRange = this.datesTarget.value.trim();
    if (!dateRange.includes("to")) {
      // Ensure there is both a start and an end date
      console.log("Incomplete date range, skipping calculation");
      this.disable(); // Ensure the button remains disabled
      return;
    }

    const [startDate, endDate] = dateRange.split(" to ");
    const start = new Date(startDate);
    const end = new Date(endDate);

    // Ensure valid start and end dates are provided
    if (isNaN(start) || isNaN(end)) {
      console.log("Invalid date range, skipping calculation");
      this.disable(); // Ensure the button remains disabled
      return;
    }

    // Calculate the difference in days
    const days = Math.ceil((end - start) / (1000 * 60 * 60 * 24)) + 1; // Days include both start and end

    // Calculate the final price
    const price = days * this.priceValue;

    console.log("Start Date:", startDate);
    console.log("End Date:", endDate);
    console.log("Total days:", days);
    console.log("Final price:", price);

    // Update the result display
    this.resultTarget.innerHTML = `Total for ${days} days: €${price.toFixed(2)}`;
    this.difference = days; // Update difference
    this.enable(); // Enable the button if conditions are met
  }

  enable() {
    if (this.difference >= 1) { // Ensure a valid difference (at least 1 day)
      console.log("Enabling button");
      this.bookBtnTarget.removeAttribute("disabled");
      this.bookBtnTarget.classList.remove("btn-disabled");
      this.bookBtnTarget.classList.add("btn-primary");
    }
  }

  disable() {
    console.log("Disabling button");
    this.bookBtnTarget.setAttribute("disabled", "true");
    this.bookBtnTarget.classList.add("btn-disabled");
    this.bookBtnTarget.classList.remove("btn-primary");
  }
}
