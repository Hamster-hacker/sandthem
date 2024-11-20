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
    // we have the price
    const dateRange = this.datesTarget.value;
    const [startDate, endDate] = dateRange.split(" to ");
    const finalEndDate = endDate || startDate;

    const start = new Date(startDate);
    const end = new Date(finalEndDate);

    // Calculate the difference in milliseconds
    const timeDifference = end - start;
    this.difference = timeDifference;

    // Convert milliseconds to days
    const days = Math.ceil(timeDifference / (1000 * 60 * 60 * 24)) + 1; // Adding 1 to include both start and end date

    // Calculate the final price
    const price = days * this.priceValue;

    console.log("Start Date:", startDate);
    console.log("End Date:", finalEndDate);
    console.log("Final price:", price);

    // Inject the result into the result target
    this.resultTarget.innerHTML = `Total Price: €${price.toFixed(2)}`;

        // we have the start date and end date
    // calculate the amount of days and multiply with price
    // calculate the total price
    // inject total price in html
    this.enable();
  }

  enable() {
    if (this.difference > 0) { // Check if totalPrice has been calculated
      console.log("working");
      console.log("Total Price:", this.totalPrice); // Debugging line to confirm the value
      this.bookBtnTarget.removeAttribute("disabled"); // Enable the button
      this.bookBtnTarget.classList.remove("btn-disabled");
      this.bookBtnTarget.classList.add("btn-primary");
    }
  }
}

// days = (@booking.end_date - @booking.start_date).to_i + 1
//       price = days * @dream.price.to_f
//       price = price.round(5)
