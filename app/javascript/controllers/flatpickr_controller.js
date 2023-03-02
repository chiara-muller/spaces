import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const unvailableDates = JSON.parse(document.getElementById("space-booking-dates").dataset.unavailable)

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]

  connect() {
    console.log("13:42")
    flatpickr(this.startTimeTarget, {
      disable: unvailableDates,
      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#end_time"})]})
    flatpickr(this.endTimeTarget, {
      disable: unvailableDates
    })
  }
}
