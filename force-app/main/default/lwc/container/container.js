import { LightningElement } from 'lwc';
export default class Container extends LightningElement {
    handleShowModal() {
    const modal = this.template.querySelector("c-modal-Popup");
    modal.show();
  }
}