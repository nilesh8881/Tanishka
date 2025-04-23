import { LightningElement } from 'lwc';

export default class LwcHeader extends LightningElement {
    clickedButtonLabel;

    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
}
}