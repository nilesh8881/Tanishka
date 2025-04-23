import { LightningElement, api} from 'lwc';

export default class DesigningAttributes extends LightningElement {
    @api recordId;
    @api heading = "default value";
}