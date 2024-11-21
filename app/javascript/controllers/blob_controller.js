import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["blob"];

  connect() {
    this.handleMouseMove = this.handleMouseMove.bind(this);
    document.addEventListener("mousemove", this.handleMouseMove);
  }

  disconnect() {
    document.removeEventListener("mousemove", this.handleMouseMove);
  }

  handleMouseMove(event) {
    // Get the mouse coordinates relative to the window
    const mouseX = event.clientX;
    const mouseY = event.clientY;

    // Get the blob element dimensions and position
    const blob = this.element;
    const blobRect = blob.getBoundingClientRect();
    const blobWidth = blobRect.width;
    const blobHeight = blobRect.height;

    // Calculate the center of the blob element
    const blobCenterX = blobRect.left + blobWidth / 2;
    const blobCenterY = blobRect.top + blobHeight / 2;

    // Calculate the movement delta based on the mouse position
    const deltaX = (mouseX - blobCenterX) / 20; // Adjust the multiplier to control movement
    const deltaY = (mouseY - blobCenterY) / 20; // Adjust the multiplier to control movement

    // Apply the transform to move the blob
    blob.style.transform = `translate(${deltaX}px, ${deltaY}px)`;
  }
}
