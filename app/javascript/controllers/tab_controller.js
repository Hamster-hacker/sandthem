import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {
  static targets = ["dreamsElement",
                    "dreamsButtonElement",
                    "bookingsElement",
                    "bookingsButtonElement",
                    "salesElement",
                    "salesButtonElement"
                  ]
  connect() {
    console.log('connected');

  }

  openTab1() {
      this.dreamsElementTarget.classList.remove("d-none")
      this.bookingsElementTarget.classList.add("d-none")
      this.salesElementTarget.classList.add("d-none")


      this.dreamsButtonElementTarget.classList.add("active")
      this.bookingsButtonElementTarget.classList.remove("active")
      this.salesButtonElementTarget.classList.remove("active")

    }

    openTab2() {
      this.dreamsElementTarget.classList.add("d-none")
      this.bookingsElementTarget.classList.remove("d-none")
      this.salesElementTarget.classList.add("d-none")


      this.dreamsButtonElementTarget.classList.remove("active")
      this.bookingsButtonElementTarget.classList.add("active")
      this.salesButtonElementTarget.classList.remove("active")

    }

    openTab3() {
      this.dreamsElementTarget.classList.add("d-none")
      this.bookingsElementTarget.classList.add("d-none")
      this.salesElementTarget.classList.remove("d-none")


      this.dreamsButtonElementTarget.classList.remove("active")
      this.bookingsButtonElementTarget.classList.remove("active")
      this.salesButtonElementTarget.classList.add("active")

    }





      // // Declare all variables
      // var i, tabcontent, tablinks;

      // // Get all elements with class="tabcontent" and hide them
      // tabcontent = document.getElementsByClassName("tabcontent");
      // for (i = 0; i < tabcontent.length; i++) {
      //   tabcontent[i].style.display = "none";
      // }

      // // Get all elements with class="tablinks" and remove the class "active"
      // tablinks = document.getElementsByClassName("tablinks");
      // for (i = 0; i < tablinks.length; i++) {
      //   tablinks[i].className = tablinks[i].className.replace(" active", "");
      // }

      // // Show the current tab, and add an "active" class to the button that opened the tab
      // document.getElementById(tabName).style.display = "block";
      // evt.currentTarget.className += " active";




}
