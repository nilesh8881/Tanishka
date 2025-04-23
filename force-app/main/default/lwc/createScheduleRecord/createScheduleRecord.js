import { LightningElement, track, wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Schedule_OBJECT from '@salesforce/schema/Schedule__c';
import createCustomObject from '@salesforce/apex/CustomObjectController.createCustomObject';
import { refreshApex } from '@salesforce/apex';
export default class CreateScheduleRecord extends LightningElement {
    @track custObjRecord = Schedule_OBJECT;

    @track selectedStatus;
    @track statusValues = [];

    @track selectedRepeat;
    @track RepeatValues = [];

    @track selectedSubject;
    @track SubjectValues = [];

    @track selectedDay;
    @track DayValues = [];
    
    // Change Handlers.
    subjectChangedHandler(event){
        this.custObjRecord.Subject__c = event.target.value;
    }
    statusChangedHandler(event){
        this.custObjRecord.Status__c = event.target.value;
    }
    repeatChangedHandler(event){
        this.custObjRecord.Repeat__c = event.target.value;
    }
    dayChangedHandler(event){
        this.custObjRecord.Day__c = event.target.value;
    }    
    
    startTimeChangedHandler(event){
        this.custObjRecord.Start_Time__c = event.target.value;
    }
    
    numberChangedHandler(event) {
        this.custObjRecord.Duration__c = event.detail.value;
    }
    

    @wire(getObjectInfo, { objectApiName: Schedule_OBJECT })
    objectInfo;

    @wire(getPicklistValuesByRecordType, { objectApiName: Schedule_OBJECT, recordTypeId: '0125g000000RebtAAC'})
    statusPicklistValues({error, data}) {
        if(data) {
            this.error = null;
            //Status field values
            let statusOptions = [{label:'--None--', value:'--None--'}];   
            data.picklistFieldValues.Status__c.values.forEach(key => {
                statusOptions.push({
                    label : key.label,
                    value: key.value
                })
            });

            this.statusValues = statusOptions;
            
            //Repeat field values
            let repeatOptions = [{label:'--None--', value:'--None--'}];
            data.picklistFieldValues.Repeat__c.values.forEach(key => {
                repeatOptions.push({
                    label : key.label,
                    value: key.value
                })
            });

            this.RepeatValues = repeatOptions;

            //Subject field values
            let subjectOptions = [{label:'--None--', value:'--None--'}];
            data.picklistFieldValues.Subject__c.values.forEach(key => {
                subjectOptions.push({
                    label : key.label,
                    value: key.value
                })
            });

            this.SubjectValues = subjectOptions;

            //Day field values
            let dayOptions = [{label:'--None--', value:'--None--'}];
            data.picklistFieldValues.Day__c.values.forEach(key => {
                dayOptions.push({
                    label : key.label,
                    value: key.value
                })
            });

            this.DayValues = dayOptions;
        }

        else if(error) {
            this.error = JSON.stringify(error);
        }
    }   
   

    // Insert record.
    createSchedule(){
        createCustomObject({
            newCustomObjRecord: this.custObjRecord
        })
        .then(result => {
            
            this.custObjRecord = {};
            

            console.log('result ===> '+result);
            
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Custom Object Record Created Successfully!!',
                variant: 'success'
            }),);
        })
        .catch(error => {
            this.error = error;
        });

    }
    async refresh() {
        await refreshApex(this.Schedule__c);
    }
}