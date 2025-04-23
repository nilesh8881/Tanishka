import { LightningElement } from 'lwc';

export default class ButtonMenuOnselect extends LightningElement {
    selectedItemValue;
    showTab1 = false;
    //showTab2 = false;
    //showTab3 = false;

    handleOnselect(event) {
        this.selectedItemValue = event.detail.value;
        this.showTab1 = true;
        //this.changeTab(event.detail.value);
    }
    

    /*changeTab(tabname){
        if(tabname == 'MenuItemOne'){
            showTab1 = true;
            showTab2 = false;
            showTab3 = false;
        }
        if(tabname == 'MenuItemTwo'){
            showTab1 = true;
            showTab2 = false;
            showTab3 = false;
        }
        if(tabname == 'MenuItemThree'){
            showTab1 = true;
            showTab2 = false;
            showTab3 = false;
        }
    }*/
}