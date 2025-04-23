import { LightningElement, track } from 'lwc';

export default class DynamicForm extends LightningElement {
    @track selectedFormType = ' ';
    @track showNameField = false;
    @track showEmailField = false;

    formTypeOptions = [
        { label: 'Select Form Type', Value:''},
        { label: 'Name', Value:'name'},
        { label: 'Email', value: 'email'}
    ]

    handleFormTypeChange(event) {
        this.selectedFormType = event.detail.value;
        this.showNameField = this.selectedFormType === 'name';
        this.showEmailField = this.selectedFormType === 'email'; 
    }
}