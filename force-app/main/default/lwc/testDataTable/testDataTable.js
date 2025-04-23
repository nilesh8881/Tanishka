import { LightningElement, wire  } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getContacts from '@salesforce/apex/contactController.getContactList';
import createContact from '@salesforce/apex/contactController.createContact';
import deleteContact from '@salesforce/apex/contactController.deleteContact';

const COLUMNS = [
  { label: 'First Name', fieldName: 'FirstName', type: 'text' },
  { label: 'Last Name', fieldName: 'LastName', type: 'text' },
  { label: 'Email', fieldName: 'Email', type: 'email' },
  { label: 'Phone', fieldName: 'Phone', type: 'phone' },
  {
    type: 'button',
    typeAttributes: { iconName: 'utility:edit', label: 'Edit', name: 'edit' }
  },
  {
    type: 'button',
    typeAttributes: { iconName: 'utility:delete', label: 'Delete', name: 'delete' }
  }
];  


const NEW_CONTACT_FIELDS = [
  { label: 'First Name', fieldName: 'firstName', type: 'text' },
  { label: 'Last Name', fieldName: 'lastName', type: 'text' },
  { label: 'Email', fieldName: 'email', type: 'email' },
  { label: 'Phone', fieldName: 'phone', type: 'phone' }
];

export default class TestDataTable extends LightningElement {
  contacts;
  
  columns = COLUMNS;
  error;
  refreshTable;
  showNewContactModal = false;
  newContactFields = NEW_CONTACT_FIELDS;

  @wire(getContacts)
  wiredContacts(result) {
    this.refreshTable = result;
    if (result.data) {
      this.contacts = result.data;
      this.error = undefined;
    } else if (result.error) {
      this.error = result.error;
      this.contacts = undefined;
    }
  }

  handleRowAction(event) {
    const action = event.detail.action;
    const row = event.detail.row;

    switch (action.name) {
      case 'edit':
        // Handle edit button click
        break;
      case 'delete':
        deleteContact({ contactId: row.Id })
          .then(() => {
            // Refresh the contact data to reflect the deleted record
            return refreshApex(this.refreshTable);
          })
          .catch((error) => {
            console.error(error);
          });
        break;
      default:
        // Do nothing
    }
  }

  handleNewRecord() {
    this.showNewContactModal = true;
  }

  handleCloseModal() {
    this.showNewContactModal = false;
  }

  handleSaveNewContact(event) {
    const fields = event.detail.fields;
    createContact({ firstName: fields.FirstName,
                    lastName: fields.LastName,
                    email: fields.Email,
                    phone: fields.Phone 
                  })
      .then(() => {
        this.showNewContactModal = false;
        return refreshApex(this.refreshTable);
      })
      .catch((error) => {
        console.error(error);
      });
  }
}