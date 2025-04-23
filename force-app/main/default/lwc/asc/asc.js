import { api, LightningElement, wire } from 'lwc';
import My_Resource from '@salesforce/resourceUrl/facebookimg';
import { loadStyle } from 'lightning/platformResourceLoader';
import { NavigationMixin } from 'lightning/navigation';
import awesome from '@salesforce/resourceUrl/awesome';
import bootstrap from '@salesforce/resourceUrl/bootstrap';
   // resource = NavCss + '/bootstrap.min.css'+ '/font-awesome.min.css' + '/bootstrap.min.js' + '/jquery-3.2.1.slim.min.js' + '/popper.min.js';
   export default class asc  extends NavigationMixin( LightningElement ) {
    facebookimg = My_Resource + '/images/facebook2.jpg';
   renderedCallback() {
        Promise.all([
            loadStyle( this, awesome, bootstrap )
            ]).then(() => {
                console.log( 'iles loaded' );
            })
            .catch(error => {
                console.log( error.body.message );
        });

    }
   
}