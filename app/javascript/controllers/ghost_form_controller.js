import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ghost-form"
export default class extends Controller {
  static targets = [ "originalForm", "ghostForm" ]

  connect() {
  }

  requestResetForm(event) {
    this.originalFormTarget.action = this.originalFormTarget.dataset["urlForRequestResetForm"]
    this.originalFormTarget.requestSubmit()
  }
}
