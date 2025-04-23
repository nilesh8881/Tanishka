import { LightningElement } from 'lwc';

export default class MyCommunityPage extends LightningElement {
    greeting = 'World';
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}