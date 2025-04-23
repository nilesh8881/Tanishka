// myComponent.js
import { LightningElement, wire, track } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { getFieldSet } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { deleteRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

import { refreshApex } from '@salesforce/apex';
import getContacts from '@salesforce/apex/contactController.getContacts';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import CONTACT_NAME_FIELD from '@salesforce/schema/Contact.Name';
import CONTACT_PHONE_FIELD from '@salesforce/schema/Contact.Phone';

const FIELDS = [
  CONTACT_NAME_FIELD,
  CONTACT_PHONE_FIELD
];

export default class MyComponent extends NavigationMixin(LightningElement) {
  @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
  objectInfo;

  @wire(getFieldSet, { objectApiName: CONTACT_OBJECT, fieldSetName: 'yourFieldSetName' })
  fieldSetMetadata({ error, data }) {
    if (data) {
      this.columns = data.map(field => ({
        label: field.label,
        fieldName: field.apiName,
        type: 'text',
        sortable: true
      }));
      this.columns.push({
        label: 'Actions',
        type: 'action',
        typeAttributes: {
          rowActions: [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'delete' }
          ],
        },
      });
    }
  }

  @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
  contact;

  @wire(getPicklistValues, { recordTypeId: '$objectInfo.data.defaultRecordTypeId', fieldApiName: 'Contact' })
  contactPicklistValues;

  @wire(getContacts)
  wiredContacts(result) {
    this.wiredContactsResult = result;
    if (result.data) {
      this.contacts = result.data;
    }
  }

  @track searchTerm = '';

  handleSearchTermChange(event) {
    this.searchTerm = event.target.value;
  }

  handleSearch() {
    // Filter the data table based on the search term
    const filteredContacts = this.contact.data.filter((contact) => {
      const contactName = getFieldValue(contact, CONTACT_NAME_FIELD);
      return contactName.toLowerCase().includes(this.searchTerm.toLowerCase());
    });

    // Update the data table with the filtered results
    this.contacts = filteredContacts;
  }

  handleRowAction(event) {
    const actionName = event.detail.action.name;
    const contactId = event.detail.row.Id;

    switch (actionName) {
      case 'edit':
        this.editContact(contactId);
        break;
      case 'delete':
        this.deleteContact(contactId);
        break;
      // Add more cases for other row actions if needed
    }
  }

  editContact(contactId) {
    // Implement the logic to navigate to the contact edit page
    this[NavigationMixin.Navigate]({
      type: 'standard__recordPage',
      attributes: {
        recordId: contactId,
        actionName: 'edit'
      }
    });
  }
   deleteContact(contactId) {
    deleteRecord(contactId)
      .then(() => {
        // Handle successful deletion
        refreshApex(this.wiredContactsResult);
      })
      .catch((error) => {
        // Handle error during deletion
        console.error(error);
      });
  }
}