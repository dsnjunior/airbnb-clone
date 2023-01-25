import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  getModalId() {
    const modalId = this.element.dataset.modalId
    if (!modalId) {
      throw new Error('No modalId specified. Add a data-modal-id attribute to the controller element.')
    }
    return modalId
  }

  open() {
    const modalId = this.getModalId()
    document.getElementById(modalId).classList.remove('hidden')
  }

  close() {
    const modalId = this.getModalId()
    document.getElementById(modalId).classList.add('hidden')
  }
}
