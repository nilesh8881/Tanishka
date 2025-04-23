import { LightningElement, wire, track} from 'lwc';
import getAccountList from '@salesforce/apex/wireDemoClass.getAccountList';
const columns = [
    {label: 'Name', fieldName:'Name'},
    {label: 'Account Id', fieldName: 'Id'},
];
export default class WireDemoRaider extends LightningElement {

    @track columns = columns;
    @track data = [];

    @wire(getAccountList)
    wiredAccount({data, error}){
        if(data){
            this.data = data;
        }
        else if(error){
            console.log("error occured");
        }
    }
}