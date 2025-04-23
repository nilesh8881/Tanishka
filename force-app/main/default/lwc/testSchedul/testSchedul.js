import { LightningElement, track, wire} from 'lwc';
import getSchedules from '@salesforce/apex/CustomObjectController.getSchedules';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Schedule_OBJECT from '@salesforce/schema/Schedule__c';
import createCustomObject from '@salesforce/apex/CustomObjectController.createCustomObject';


export default class GetDataDisplayData extends LightningElement {
     /*@track columns = [
        { label: 'Day', fieldName: 'Day__c' },
        { label: 'Start Time', fieldName: 'Start_Time__c' },
        { label: 'Duration', fieldName: 'Duration__c' },
        { label: 'Subject', fieldName: 'Subject__c' },
        { label: 'Status', fieldName: 'Status__c' }
      ];

     @track scheduleList;

     @wire (getSchedules) 
     wiredSchedules({data,error}){
          if (data) {
            this.scheduleList = data;
            console.log(data); 
          } else if (error) {
            console.log(error);
          }else{
            console.log('unknown error')
          }
     }*/

     @wire(getSchedules) wiredSchedules;
}