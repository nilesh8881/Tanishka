import { LightningElement, track, wire } from 'lwc';
//import { NavigationMixin } from 'lightning/navigation';
//import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import searchContacts from '@salesforce/apex/ContactController.searchContacts';
//import deleteContact from '@salesforce/apex/ContactController.deleteContact';
/*const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { type: 'button', typeAttributes: { label: 'Edit', name: 'edit' } },
    { type: 'button', typeAttributes: { label: 'Delete', name: 'delete' } }
];*/

import searchContacts from '@salesforce/apex/contactController.searchContacts';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';


//import { createRecord } from 'lightning/uiRecordApi';
//import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import { NavigationMixin } from 'lightning/navigation';
/*import CONTACT_OBJECT from '@salesforce/schema/Contact';
import contactFirstName from '@salesforce/schema/Contact.FirstName';
import contactLastName from '@salesforce/schema/Contact.LastName';
import contactPhone from '@salesforce/schema/Contact.Phone';
import contactEmail from '@salesforce/schema/Contact.Email';
import accountFieldId from '@salesforce/schema/Contact.AccountId';*/

export default class TestContactLwc extends LightningElement {
 /*@track selectedAccountId;
    @track contactId;    
    @track firstname = '';   
    @track lastname = '';  
    @track phoneNo = '';
    @track emailId = '';
 
    contactHandleChange(event) {
        console.log(event.target.label);
        console.log(event.target.value);        
        if(event.target.label=='First Name'){
            this.firstname = event.target.value;
        }
        if(event.target.label=='Last Name'){
            this.lastname = event.target.value;
        }   
        
        if(event.target.label=='Phone'){
            this.phoneNo = event.target.value;
        }
 
        if(event.target.label=='Email'){
            this.emailId = event.target.value;
        }
                   
    }
 
    createLookupContactAction(){
        console.log(this.selectedAccountId);
        const fields = {};
        fields[contactFirstName.fieldApiName] = this.firstname;
        fields[contactLastName.fieldApiName] = this.lastname;
        fields[contactPhone.fieldApiName] = this.phoneNo;
        fields[contactEmail.fieldApiName] = this.emailId;
        
        fields[accountFieldId.fieldApiName] = this.selectedAccountId;
        const recordInput = { apiName: CONTACT_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then(contactobj=> {
                this.contactId = contactobj.id;
                this.fields={};
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created successfully..!',
                        variant: 'success',
                    }),
                    
                );
                window.console.log(JSON.stringify(result));
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: contactobj.id,
                        objectApiName: 'Contact',
                        actionName: 'view'
                    },
                });
 
 
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    }*/


    /*searchKey = '';
    columns = columns;
    selectedContactId;
    showEditForm = false;
    showDeleteModal = false;

    @wire(searchContacts, { searchKey: '$searchKey' })
    contacts;

    handleSearch(event) {
        this.searchKey = event.target.value;
    }

    handleRowAction(event) {
        let action = event.detail.action;
        let contact = event.detail.row;

        switch(action.name) {
            case 'edit':
                this.selectedContactId = contact.Id;
                this.showEditForm = true;
                break;
            case 'delete':
                this.selectedContactId = contact.Id;
                this.showDeleteModal = true;
                break;
        }
    }

    handleEditFormSubmit(event) {
        event.preventDefault();

        this.template.querySelector('lightning-record-edit-form').submit();
    }

    handleEditFormCancel() {
        this.showEditForm = false;
    }

    handleDeleteModalCancel() {
        this.showDeleteModal = false;
    }

    handleDeleteModalConfirm() {
        deleteContact({ contactId: this.selectedContactId })
            .then(() => {
                // refresh data after delete
                return refreshApex(this.wiredContacts);
            })
            .catch(error => {
                console.log('Error deleting record: ', error.body.message);
            });
    }*/

    searchKey = '';
    contacts = [];
    columns = [
        { label: 'First Name', fieldName: 'FirstName', type: 'text' },
        { label: 'Last Name', fieldName: 'LastName', type: 'text' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Account Name', fieldName: 'AccountName', type: 'text' },
        { label: 'Owner Name', fieldName: 'OwnerName', type: 'text' }
    ];

    @wire(getObjectInfo, { objectApiName: 'Contact' })
    objectInfo;

    @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: 'Contact.Status__c' })
    statusPicklistValues;

    handleSearchKeyChange(event) {
        this.searchKey = event.target.value;
        this.searchContacts();
    }

    @wire(searchContacts, { searchKey: '$searchKey' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data.map(contact => {
                return {...contact, AccountName: contact.Account.Name, OwnerName: contact.Owner.Name};
            });
        } else if (error) {
            console.log('Error: ', error);
        }
    }

    handleRowActions(event) {
        const action = event.detail.action;
        const row = event.detail.row;
        switch (action.name) {
            case 'edit':
                this.editContact(row);
                break;
            case 'delete':
                this.deleteContact(row);
                break;
            default:
        }
    }

    editContact(row) {
        console.log('Edit Contact: ', row);
    }

    deleteContact(row) {
        console.log('Delete Contact: ', row);
    }
}