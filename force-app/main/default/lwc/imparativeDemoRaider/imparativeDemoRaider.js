import { LightningElement,track } from 'lwc';
import getAccountList from '@salesforce/apex/imparativeDemoClass.getAccountList';

const columns =[
    {label: 'Account Id', fieldName:'Id'},
    {label: 'Account Name', fieldName: 'Name'},
]
export default class ImparativeDemoRaider extends LightningElement {

    @track data =[];
    @track columns = columns;

    connectedCallback() {
        getAccountList()
        //promise return
        .then(result =>{
            this.data = result;
        })//if retun list is empty then error show
        .catch(error=>{
            consol.log("Error Occured");
        })
    }
}