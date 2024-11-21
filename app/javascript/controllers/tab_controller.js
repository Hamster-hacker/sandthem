import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = [ "button", "tab"]
  connect() {
    console.log('connected');

  }

  openTab(e) {
    this.buttonTargets.forEach((button) => {
      button.classList.remove("active")
    })

    this.tabTargets.forEach((tabTarget) => {
      tabTarget.classList.add("d-none")
    })

    const target = this.tabTargets.find((tabTarget) => {
      return tabTarget.id === e.currentTarget.dataset.result
    })

    e.currentTarget.classList.add("active")
    target.classList.remove("d-none")
  }
}
