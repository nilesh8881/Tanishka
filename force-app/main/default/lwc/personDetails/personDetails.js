import { LightningElement } from 'lwc';

export default class PersonDetails extends LightningElement {

    name = 'Nilesh';
    details = 'Nilesh is the CEO and Founder of M Software';
    showDetails = false;
    actionButtonLabel = 'Show Details';

    toggleDetails() {
        this.showDetails = !this.showDetails;
        this.actionButtonLabel = this.showDetails ? 'Hide Details' : 'Show Details';
        console.log(this.showDetails);
    }
}