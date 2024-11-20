import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="username"
export default class extends Controller {

  static targets = ["items", "form"]

  connect() {
    console.log("this.element", this.element)
    console.log("this.itemsTarget",this.itemsTarget)
    console.log("this.formTarget",this.formTarget)
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          // beforeend could also be dynamic with Stimulus values
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
