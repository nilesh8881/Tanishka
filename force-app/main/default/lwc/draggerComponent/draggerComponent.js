import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccList';
export default class DraggerComponent extends LightningElement {
    @wire(getAccounts) accounts;
    handleDragStart(event){
        event.dataTransfer.setData("account_id", event.target.dataset.item);
    }
}