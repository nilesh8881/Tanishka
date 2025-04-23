import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  dynamicGreeting = 'World';
  changeHandler(event) {
    this.dynamicGreeting = event.target.value;
  }
}