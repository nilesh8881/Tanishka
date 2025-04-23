import { LightningElement, track } from 'lwc';


export default class NewSteps extends LightningElement {
    @track toggleIconName = 'utility:add';  
    @track boolVisible = false;  
  
    handleClick() {  
        // const label = event.target.label;  
  
        if ( this.toggleIconName === 'utility:add' ) {  
  
            this.toggleIconName = 'utility:dash';  
            this.boolVisible = true;  
  
        } else if  ( this.toggleIconName === 'utility:dash' ) {  
              
            this.toggleIconName = 'utility:add';  
            this.boolVisible = false;  
  
        }  
    }
}