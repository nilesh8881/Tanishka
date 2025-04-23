import { LightningElement, wire , track} from 'lwc';
import getAccountList from '@salesforce/apex/foreachDemoClass.getAccountList';
export default class ForeatchDemoRaider extends LightningElement {

    @track data=[];
    @wire(getAccountList)
    accounts;
}