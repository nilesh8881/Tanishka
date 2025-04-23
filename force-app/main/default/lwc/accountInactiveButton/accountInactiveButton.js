import { LightningElement, api, track} from 'lwc';
import { getRecord, notifyRecordUpdateAvailable } from "lightning/uiRecordApi";
import Status_InActive from '@salesforce/label/c.Status_InActive';
import Status_Active from '@salesforce/label/c.Status_Active';
import getAccountStatus from '@salesforce/apex/AccountinactivebtnController.getAccountStatus';

export default class AccountInactiveButton extends LightningElement {
@api recordId = '0015g00000mKUXrAAO';
@track showbtn = false;

label={
    Status_InActive,
    Status_Active
}
connectedCallback() {
        getAccountStatus ({accId : this.recordId})
        .then ((result) => {
            if(result){
                if(result.Status__c ==='In Active'){
                    this.showbtn = true;
                }
            }else if(error){
                //error
            }

        })
    }

}