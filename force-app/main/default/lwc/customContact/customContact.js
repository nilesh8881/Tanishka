import { LightningElement, track, wire } from 'lwc';
import fetchContactFieldSetData from '@salesforce/apex/contactController.fetchContactFieldSetData';
import getFieldSet from '@salesforce/apex/contactController.getFieldSet';
import getContactList from '@salesforce/apex/contactController.getContactList';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import contactFirstName from '@salesforce/schema/Contact.FirstName';
import contactLastName from '@salesforce/schema/Contact.LastName';
import contactPhone from '@salesforce/schema/Contact.Phone';
import contactEmail from '@salesforce/schema/Contact.Email';
import accountFieldId from '@salesforce/schema/Contact.AccountId';
import { deleteRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';

// import standard toast event 

const actions = [
    { label: 'Edit', name: 'edit', iconName: 'utility:edit' },
];

const columns = [
    { label: 'First Name', fieldName: 'FirstName', type: 'text' },
    { label: 'Last Name', fieldName: 'LastName', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { type: 'action', typeAttributes: { rowActions: actions } },
];

export default class CustomContact extends NavigationMixin(LightningElement) {
    @track wiredContacts;
    @track data;
    @track columns;
    @track error;
    @track contacts;
    @track contactsRecord;
    @track selectedAccountId;
    @track contactId;
    
    firstname = '';
    lastname = '';
    phoneNo = '';
    emailId = '';
    searchValue = '';
    @track isModalOpen = false;
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    submitDetails() {
        // to close modal set isModalOpen tarck value as false
        //Add your code to call apex method or do some processing
        this.isModalOpen = false;
    }

    contactHandleChange(event) {
        console.log(event.target.label);
        console.log(event.target.value);
        if (event.target.label == 'First Name') {
            this.firstname = event.target.value;
        }
        if (event.target.label == 'Last Name') {
            this.lastname = event.target.value;
        }

        if (event.target.label == 'Phone') {
            this.phoneNo = event.target.value;
        }

        if (event.target.label == 'Email') {
            this.emailId = event.target.value;
        }

    }

    createLookupContactAction() {
        console.log(this.selectedAccountId);
        const fields = {};
        fields[contactFirstName.fieldApiName] = this.firstname;
        fields[contactLastName.fieldApiName] = this.lastname;
        fields[contactPhone.fieldApiName] = this.phoneNo;
        fields[contactEmail.fieldApiName] = this.emailId;

        fields[accountFieldId.fieldApiName] = this.selectedAccountId;
        const recordInput = { apiName: CONTACT_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then(contactobj => {
                refreshApex(this.wiredContacts);
                this.contactId = contactobj.id;
                this.fields = {};
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created successfully..!',
                        variant: 'success',
                    }),
                );
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: contactobj.id,
                        objectApiName: 'Contact',
                        actionName: 'view'
                    },
                });
                refreshApex(this.wiredContacts); // Refresh the data after creating the contact
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
    }
    myLookupHandle(event) {
        console.log(event.detail);
        this.selectedAccountId = event.detail;
    }

    @wire(getFieldSet, { sObjectName: 'Contact', fieldSetName: 'Contact_Search_Fields' })
    wiredFields({ error, data }) {
        if (data) {
            data = JSON.parse(data);
            console.log(data);
            let cols = [];
            data.forEach(currentItem => {
                let col = { label: currentItem.label, fieldName: currentItem.name };
                cols.push(col);
            });
            // Add new column for delete/edit icons
            cols.push({
                type: 'action',
                typeAttributes: {
                    rowActions: [
                        { label: 'Edit', name: 'edit' },
                        { label: 'Delete', name: 'delete' }
                    ]
                }
            });
            this.columns = cols;
            
        } else if (error) {
            console.log(error);
            this.error = error;
            this.columns = undefined;
        }
    }


    @wire(fetchContactFieldSetData, {})
    wiredContactss({ error, data }) {
        if (data) {
            this.data = data;
            console.log(this.data);
            this.error = undefined;
        } else if (error) {
            console.log(error);
            this.error = error;
            this.data = undefined;
        }

        // Get the updated contact list
        getContactList()
            .then(result => {
                // Add the new contact to the list
                if (this.contactId) {
                    const newContact = result.find(contact => contact.Id === this.contactId);
                    if (newContact) {
                        this.contactId = undefined;
                        this.contactList.unshift(newContact);
                    }
                }
                // Assign the updated contact list to the data variable
                this.data = this.contactList;
            })

            .catch(error => {
                console.log(error);
                this.error = error;
            });
    }

    get isColumnsDataAvailable() {
        return this.data && this.columns;
    }

    handleSearchKeyChange(event) {
        this.searchValue = event.target.value;
        if (this.searchValue) {
            let filteredData = [];
            this.data.forEach(function (record) {
                for (var key in record) {
                    if (record.hasOwnProperty(key) && typeof record[key] === 'string' && record[key].toLowerCase().indexOf(this.searchValue.toLowerCase()) > -1) {
                        filteredData.push(record);
                        break;
                    }
                }
            }, this);
            this.data = filteredData;
        } else {
            this.wiredContactss();
        }
    }

    handleRowActions(event) {
        let action = event.detail.action;
        let row = event.detail.row;

        switch (action.name) {
            case 'edit':
                // Navigate to the edit record page
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: row.Id,
                        objectApiName: 'Contact',
                        actionName: 'edit'
                    }
                });
                break;
            case 'delete':
                // Show confirmation dialog before deleting the record
                if (confirm('Are you sure you want to delete this contact?')) {
                    // Delete the record
                    deleteRecord(row.Id)
                        .then(() => {
                            // Remove the record from the data table
                            const index = this.data.findIndex(d => d.Id === row.Id);
                            if (index !== -1) {
                                this.data.splice(index, 1);
                                this.data = [...this.data];
                                this.showToast('Success', 'Contact deleted', 'success');
                                refreshApex(this.wiredContacts); // Refresh the data after deleting the contact
                            }
                        })
                        .catch(error => {
                            this.showToast('Error', error.body.message, 'error');
                        });
                }
                break;
                default:
                break;
        }
    }
}