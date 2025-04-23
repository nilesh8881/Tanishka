import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class RaiderLwc extends LightningElement {
    myTitle = "Raider Data Solutions";

    connectedCallback() {
        //inside declare proprty and same scope var keyword used
        var name = "Test Raider";
        name = "Nilesh";
        window.alert("Name:- "+name);
        // inside the block wrok and mutable 
        let names = "Test Raider 1";
        names = "Siona";
        window.alert("names:--" +names);
        // not mutable const value and inside block its work 
        const namess = "Mahesh";
        window.alert("namess:--"+namess);

        let callMyFunction = this.myFunction(10/2);
        window.alert("callMyFunction :- " +callMyFunction);
    }
    // learn how to call one function call to another fuction ?
    //function 1 
    //button functon hello Raider
    handleClick(){
        this.showToast(this.myTitle);
        
          window.alert("Test button");
    }
    //function 2
    showToast(firstFunctionArguments){
        // create event
        const event = new ShowToastEvent({
        title:'firstFunctionArguments',
        message: 'Show Toast Massage',
        variant : 'success',
        })
        //call the above event or fire the event 
    this.dispatchEvent(event);

    }
    // for mathematical calulation 
    myFunction(dividand,devisor){
        return(dividand/devisor); //(10/2 = 5) call this function in connected call back
    }
    //Arrow Function
    /*myFunction =(dividand, devisor) =>{
        return(dividand/devisor);
    }*/
}