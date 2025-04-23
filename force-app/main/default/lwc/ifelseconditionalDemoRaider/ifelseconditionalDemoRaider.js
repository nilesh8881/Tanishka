import { LightningElement, track } from 'lwc';
export default class IfelseconditionalDemoRaider extends LightningElement {
    @track onClickButton = 'Show';
    myTitle ='Raider Data Services'
    @track cardVisibal = false;

    handleClick(event){
        const label= event.target.label;
        if(label === 'Show'){
            this.onClickButton = 'Hide';
            this.cardVisibal = true;

        }else if(label === 'Hide'){
            this.onClickButton = 'Show';
            this.cardVisibal = false;

        }
    }

}