import { LightningElement,api, wire} from 'lwc';

export default class DistanceTimeTravel extends LightningElement {
    @api recordId; 
    connectedCallback()
    {
        alert('This is LWC. Account Id -> ' + this.recordId);
    }
}