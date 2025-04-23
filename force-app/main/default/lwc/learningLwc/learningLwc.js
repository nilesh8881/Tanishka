import { LightningElement } from 'lwc';
export default class LearningLwc extends LightningElement {
Integer =''; // property define

// on change event
handleChange1(event){
    this.Integer = event.target.value;
    }
show = true; //property define 
    handleClick(){
        this.show = !this.show;
    }
firstName='';
lastName='';
handleChange(event){
    const field = event.target.name;
    if(field === 'firstName'){
        this.firstName = event.target.value;
    }
    else if(field === 'lastName'){
        this.lastName = event.target.value;
    }
}
get uppercaseFullName(){
    return '$(this.firstName) $(this.lastName)'.toUpperCase();
}

}