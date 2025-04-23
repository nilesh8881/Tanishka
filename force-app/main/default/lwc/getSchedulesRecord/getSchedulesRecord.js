import { LightningElement, track, wire} from 'lwc';
import getSchedules from '@salesforce/apex/CustomObjectController.getSchedules'; 
import {refreshApex} from '@salesforce/apex';

export default class GetDataDisplayData extends LightningElement {
     
     @wire(getSchedules) wiredSchedules;
     callFromHtml(){
       // refreshing table data using refresh apex(HERE NEEDS TO BE SET)
       refreshApex(this.Schedule__c);
     }
}