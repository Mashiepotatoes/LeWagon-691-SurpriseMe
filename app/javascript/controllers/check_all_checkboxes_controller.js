import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["checkbox", "check3box"]

  checkAll() {
    if (this.checkboxTarget.checked === true) {
      this.check3boxTargets.forEach((box) => {
        box.checked = true;
      });
    } else {
      this.check3boxTargets.forEach((box) => {
        box.checked = false;
      });
    }
  }
}
