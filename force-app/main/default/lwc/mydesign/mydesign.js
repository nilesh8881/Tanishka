import { LightningElement } from 'lwc';

export default class Mydesign extends LightningElement {
    showoutput = false;

    submitCase(){
        this.showoutput = true;
    }
    refresh(){
        this.showoutput = true;
    }
}