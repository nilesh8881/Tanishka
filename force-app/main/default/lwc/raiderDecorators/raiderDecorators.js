import { LightningElement, api } from 'lwc';
export default class RaiderDecorators extends LightningElement {
    @api itemName ="LWC Decorators";
    
    @api handleChangeValue(){
        
        this.itemName = "Saesforce LWC Demo"; 
    }
}