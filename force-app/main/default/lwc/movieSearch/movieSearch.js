import { LightningElement } from 'lwc';
export default class MovieSearch extends LightningElement {
    selectedType = "";
    selectedSearch ="";
    selectedPageNo = "1";
    loading=false;

    gettypeoptions(){
        return[
            {label:"None", value:""},
            {label:"Movie", value:"movie"},
            {label:"Series", value:"series"},
            {label:"Episod", value:"episod"}
        ];
    }
    handelChange(event){
        let{name, value}=event.target;
        this.loading=true;
        if(name === "type"){
            this.selectedType = value;
        }
        else if(name === "search"){
            this.selectedType = value;
        }
        else if(name === "pageno"){
            this.selectedType = value;
        }
    } 
}