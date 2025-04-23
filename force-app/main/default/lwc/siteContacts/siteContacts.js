import { LightningElement, track, wire, api } from 'lwc';
import getContactList from '@salesforce/apex/contactController.getContactList';

export default class SiteContacts extends LightningElement{
    @api recordId;
    clickbuttonlabel;
    @wire(getContactList) contacts;
    @track showTabName = 'ShowTab1';
    ShowTab1 = true;
    ShowTab2 = false;
    ShowTab3 = false;
    ShowTab4 = false;
    handleclick(event){        
        this.clickbuttonlabel = event.trget.label;
        this.expand(event.trget.label);
        
    }
    expand(tabName){
        if (tabName =='Save'){
            this.ShowTab1 = false;
            this.ShowTab2 = false;
            this.ShowTab3 = true;
            this.ShowTab4 = false;
        }    
        if (tabName =='New'){
            this.ShowTab1 = false;
            this.ShowTab2 = true;
            this.ShowTab3 = false;
            this.ShowTab4 = false;
        }
        if (tabName =='Edit'){
            this.ShowTab1 = false;
            this.ShowTab2 = false;
            this.ShowTab3 = true;
            this.ShowTab4 = false;
        }
        if (tabName =='Delete'){
            this.ShowTab1 = true;
            this.ShowTab2 = false;
            this.ShowTab3 = false;
            this.ShowTab4 = false;
        }
    }
    
}