import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["total", "wrapper"]

  connect() {
    console.log("The 'notification' controller is now loaded!");
  }
