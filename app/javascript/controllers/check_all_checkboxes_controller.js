import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("hello from StimulusJS")
  }

  static targets = ["checkbox", "check4box"]

  checkAll() {
    if (this.checkboxTarget.checked === true) {
      this.check4boxTargets.forEach((box) => {
        box.checked = true;
      });
    } else {
      this.check4boxTargets.forEach((box) => {
        box.checked = false;
      });
    }
  }
}
