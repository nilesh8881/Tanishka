import { LightningElement, track,api} from 'lwc';

import Id from '@salesforce/user/Id';
export default class MyFirstLWC extends LightningElement {
    @api name = 'Nilesh Patil';
    @track title = 'CRM Consultant';
    phone = '7845127845';
    email = 'nilesh@gmail.com';
    userId = Id;
    handleclick(){
        console.log('I am Inside JS file');
        this.name='Niraj Roy';
        this.title='salesforce Develper';
        
    }
}