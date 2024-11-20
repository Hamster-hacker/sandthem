import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate"]

  enableButton() {
    const startDate = this.startDateTarget.value
    const endDate = this.endDateTarget.value
    const submitButton = this.element.querySelector('button[type="submit"]')

    if (startDate && endDate) {
      submitButton.disabled = false
    } else {
      submitButton.disabled = true
    }
  }

  submitBooking(event) {
    console.log('Form submitted')
  }
}
