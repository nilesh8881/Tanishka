import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/contactController.getContactList';

const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Title', fieldName: 'Title' },
    { label: 'Phone Number', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
];
export default class ApexDatatableExample extends LightningElement {
    error;
    columns = columns;

    @wire(getContactList)
    contacts;
}