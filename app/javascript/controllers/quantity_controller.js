import { Controller } from "stimulus";
import {csrfToken} from "@rails/ujs"

export default class extends Controller {
  static targets = ["total", "wrapper"]

  // connect() {
  //   console.log("quantity connected")
  // }

  add(e) {
    e.preventDefault();
    let productId = this.wrapperTarget.dataset.productId;
    // const quantity = parseInt(this.totalTarget.textContent)
    // this.totalTarget.textContent = quantity + 1
    // fetch result from our add route
    fetch(`/line_items?product_id=${productId}`, {
      method: "POST",
      headers: {
        'Accept': "application/json",
        'X-CSRF-Token': csrfToken()
      }
    })
      .then(res => res.json())
      .then(data => {
        this.totalTarget.innerText = data.totalLineItems
      })
  }

  reduce(e) {
    e.preventDefault();
    if (this.totalTarget.innerText > 0 ) {
      let productId = this.wrapperTarget.dataset.productId;
      fetch(`/line_items/reduce/${productId}`,{
        method: "POST",
        headers: {
          'Accept': "application/json",
          'X-CSRF-Token': csrfToken()
        }
      })
        .then(res => res.json())
        .then(data => {
          this.totalTarget.innerText = data.totalLineItems
        })
      }

  }


}
