import { LightningElement, track, wire} from 'lwc';



export default class GetDataDisplayData extends LightningElement {

    @track isScheduleDateNotVisible = true;
    @track isAddButtonVisible = true;

    handleAddButtonClick(event) {
        console.log('Button Click=>')
        this.isScheduleDateNotVisible = false;
        this.isAddButtonVisible = false;
    }
    handlecancelevent(event){
        console.log('handlecancelevent=>')
        console.log(' event.detail=>'+ event.detail)
        this.isAddButtonVisible = event.detail;
        this.isScheduleDateNotVisible = event.detail;
    }
}