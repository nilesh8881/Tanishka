import { LightningElement, wire } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import ID_FIELD from '@salesforce/schema/Case.Id';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const arrFields = ['Case.Subject'];
export default class UpdateRecord extends LightningElement {
    strCaseId = '5002x000007yAKDAA2';
    updateCase(){
        const fields = {};
        fields[ID_FIELD.fieldApiName] = this.strCaseId;
        fields[SUBJECT_FIELD.fieldApiName] = this.template.querySelector("[data-field='Subject']").value;
        const recordInput = { fields };
        updateRecord(recordInput)
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Case Updated',
                    variant: 'success'
                })
            );
        })
        .catch(error => {
            console.log(error);
        });
    }
}