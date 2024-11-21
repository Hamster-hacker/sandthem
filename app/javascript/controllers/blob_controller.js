import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blob"
export default class extends Controller {
  static targets = ["blob"]

  connect() {
    console.log("controller initialized", this.blobTarget)
    // Add event listener for mouse movement
    document.addEventListener('mousemove', (e) => {
      // Get mouse position relative to the window
      const mouseX = e.clientX;
      const mouseY = e.clientY;

      // Set limits for how much the blob moves
      const moveX = (mouseX - window.innerWidth / 2) / 10; // Control horizontal movement
      const moveY = (mouseY - window.innerHeight / 2) / 10; // Control vertical movement
      const scale = 1 + (Math.abs(mouseX - window.innerWidth / 2) + Math.abs(mouseY - window.innerHeight / 2)) / 1000; // Optional scaling

      console.log({moveX, moveY, scale})

      // Apply the transform properties dynamically
      this.blobTarget.style.transform = `translate(${moveX}px, ${moveY}px) scale(${scale})`;
    });
  }
}
