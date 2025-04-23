import { LightningElement,track } from "lwc";


export default class Mybook extends LightningElement {


 @track selectedDays ='';
 @track time;
 @track duration;
 @track effective;
 @track selectoptions = [
  { label: 'English', value: 'English' },
  { label: 'Maths', value: 'Maths' },
  { label: 'Geography', value: 'Geography' },
  { label: 'Computers', value: 'Computers' },
];

  handleCancel(event){
    console.log('handleCancel=>')
    this.isCancel = true;
    const custEvent = new CustomEvent(
      'datecancel', {
          detail: this.isCancel
      });
    this.dispatchEvent(custEvent);
  }

  get options() {
    return [
      { label: 'English', value: 'English' },
      { label: 'Maths', value: 'Maths' },
      { label: 'Geography', value: 'Geography' },
      { label: 'Computers', value: 'Computers' },
  ];
  }

    handleChange(event) {
        this.value = event.detail.value;
    }

  handleDays(event){
    console.log('=>'+event.target.name);
    if(this.selectedDays != ''){
        this.selectedDays = this.selectedDays + ';' + event.target.name;
    }
    else{
        this.selectedDays = event.target.name;
    }
    this.template.querySelector('[data-id="'+ event.target.name+'"]').classList.add('greenColor');
  }

  handleTime(event){
    this.time = event.target.value;
  }
  handleDuration(event){
    this.duration = event.target.value;
  }

  handleYear(event){
    this.effective = event.target.name;
    this.template.querySelector('[data-id="thisYear"]').classList.add('greenColor');
    this.template.querySelector('[data-id="thisMonth"]').classList.remove('greenColor');
    console.log('=>'+ this.effective);
  }

  handleMonth(event){
    this.effective = event.target.name;
    this.template.querySelector('[data-id="thisYear"]').classList.remove('greenColor');
    this.template.querySelector('[data-id="thisMonth"]').classList.add('greenColor');
    console.log('=>'+ this.effective);
  }
}