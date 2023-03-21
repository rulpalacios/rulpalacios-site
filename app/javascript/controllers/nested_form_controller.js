import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = [
    "add_item",
    "template"
  ]
  connect() {
    console.log("nested-form controller connected")
  }
  add_association(event) {
    event.preventDefault()
    
    const content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().valueOf())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove_association(event) {
    event.preventDefault()

    const wrapper = event.target.closest('.nested-fields')
    wrapper.querySelector('input[name*="_destroy"]').value = 1
    wrapper.style.display = 'none'
  }
}
