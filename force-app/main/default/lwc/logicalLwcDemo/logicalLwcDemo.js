import { LightningElement, track, wire } from 'lwc';

import mapDemo from '@salesforce/apex/UtilityClass.mapDemo';

import testName from '@salesforce/apex/UtilityClass.testName';

export default class LogicalLwcDemo extends LightningElement {
    @track greeting = " WelCome Amit!";
    @track message ='Lightning Methology';
    @track records;
    @track error;
    @track Contacts = [
        {   
            Id :  '00364585457925457',
            Name: 'Elba Gherkin'
        },
        {   
            Id : '00364585457925457',
            Name: 'Reyon Gherkin'
        },
        {   
            Id : '00364585457925457',
            Name: 'Smith Gherkin'
        }       
    ];
    @wire(testName) records;
     wiredDate({ error, date }){
         alert(data);
        if(data){
            this.records = data;
            this.error = undefined;
            console.log(this.records);
         }
         if(error){
             this.error = error;
             this.records = undefined;
             console.log(this.records);
         }
     } 
     handleClick(){
        mapDemo().then(result =>{

        })
        .catch(error =>{
            this.error = error;

        })
     }

}
//console.log(this.records);