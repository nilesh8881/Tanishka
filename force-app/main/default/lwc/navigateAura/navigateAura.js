import { LightningElement,track } from 'lwc';

export default class navigateAura extends LightningElement {
    @track subject = '';
    @track desc ='';
    showoutput = false;

    handleChange(event){
        if(event.target.lable == 'Case Subject'){
            this.subject = event.target.value;
        }
        if(event.target.lable == 'Case Description'){
            this.desc = event.target.value;
        }
    }
    
    submitCase(){
        this.showoutput = true;
    }
    refresh(){
        this.showoutput = false;
        this.subject ='';
        this.desc ='';
    }
}