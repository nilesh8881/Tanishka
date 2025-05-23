import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
    @track currentResult;
    @track previousResults=[];
    @track showPreviousResults=false;

    firstNumber;
    secondNumber;

    numberChangeHandler(event){
        const inputBoxName= event.target.name;
        if(inputBoxName=='firstNumber'){
            this.firstNumber=event.target.value;
        }else if(inputBoxName=='secondNumber'){
            this.secondNumber=event.target.value;
        }
    }
 addHandler(){
    const firstN= parseInt(this.firstNumber);
    const secondN= parseInt(this.secondNumber);

    this.currentResult='Result of '+firstN+' + '+ secondN+' is '+(firstN+secondN);
    this.previousResults.push(this.currentResult);
    //this.currentResult= 'Result of ${firstN}+${secondN} is ${firstN+secondN}';
    
   }
 subHandler(){
    const firstN= parseInt(this.firstNumber);
    const secondN= parseInt(this.secondNumber);

    this.currentResult='Result of '+firstN+' - '+ secondN+' is '+(firstN-secondN);
    this.previousResults.push(this.currentResult);
    //this.currentResult= 'Result of ${firstN}-${secondN} is ${firstN-secondN}';
    

  }
 multiplyHandler(){
    const firstN= parseInt(this.firstNumber);
    const secondN= parseInt(this.secondNumber);

    this.currentResult='Result of '+firstN+' * '+ secondN+' is '+(firstN*secondN);
    this.previousResults.push(this.currentResult);
    //this.currentResult= 'Result of ${firstN}*${secondN} is ${firstN*secondN}';
    

  }
 divisionHandler(){
    const firstN= parseInt(this.firstNumber);
    const secondN= parseInt(this.secondNumber);

    this.currentResult='Result of '+firstN+' / '+ secondN+' is '+(firstN/secondN);
    this.previousResults.push(this.currentResult);
    //this.currentResult= 'Result of ${firstN}/${secondN} is ${firstN/secondN}';
   }

   showPreviousResultToggle(event){
      this.showPreviousResults= event.target.checked;
    }
}