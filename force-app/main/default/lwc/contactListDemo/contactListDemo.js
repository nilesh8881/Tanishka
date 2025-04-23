import { LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactAuraService.getContactList';
import getAccountList from '@salesforce/apex/ContactAuraService.getAccountList';
export default class ContactListDemo extends LightningElement {
    @track searchkey;
    @track searchkeyAccount;
    
    @track contacts;
    @track error;
   
    @track accounts;
    @track errorAccount;

    @wire(getContactList, {
        name:'$searchkey'
    }) 
    wiredContact({error, data}){
        if(data){
            this.contacts = data;
        }
        if(error){
            this.contacts = error;
            console.log('Error', error);
        }
    }
    // Data and Error
    // contacts.data
    //contacts.error

    handleChange(evevt){
        evevt.preventDefault();
        console.log('value' + evevt.target.value);
        console.log(this.contacts);
        this.searchkey = evevt.target.value;
    }
    handleChangeAccount(evevt){
        evevt.preventDefault();
        console.log('value' + evevt.target.value);
        console.log(this.contacts);
        this.searchkeyAccount = evevt.target.value;
    }
    findAccounts(){
        getAccountList({
           name: this.searchkeyAccount
        })
        .then(result=>{
            console.log('result', result);
            this.accounts = result;
            
        })
        .catch(error=>{
            this.errorAccount = error;
            console.log('result', error);
        });
    }
}