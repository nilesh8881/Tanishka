import { LightningElement } from 'lwc';
export default class RaiderDecoratorsParent extends LightningElement {

    handleClick(){
        this.template.querySelector('c-raider-decorators').handleChangeValue();
}
}