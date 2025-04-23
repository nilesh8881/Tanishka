import { LightningElement, track, api} from 'lwc';
import fetchAccount from '@salesforce/apex/AccountRelatedObject.fetchAccount';
import fetchContact from '@salesforce/apex/AccountRelatedObject.getContacts';




export default class AccountRelatedCon extends LightningElement {
    @track acc;
    @track con;
    message;
    
    @api
    get iscontact(){
        if(this.con && this.con.length>0){
            return true;
        }
        return false;
    }
   
    connectedCallback(){
        fetchAccount()
        .then(result => {
        this.acc = result;

        console.log(JSON.stringify(result));
        console.log("result",this.acc);
        })

    }


    contactFetch(event){
        this.message = event.target.value;
        console.log('Contact Id-->'+this.message);
        fetchContact({accountId : this.message})

        .then(result => {
        this.con = result;

        console.log(JSON.stringify(result));
        console.log("result1",this.con);
      
            this.areDetailsVisible = true;
        })
        .catch(error =>{
        this.error = error;

        })
    }
}