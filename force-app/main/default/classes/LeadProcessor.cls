global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        //List<Lead> leads = new List<Lead>();
        System.debug('::>>' +scope);
        for (Lead ld : scope) {
            if(ld.LeadSource != 'Dreamforce'){
                ld.LeadSource = 'Dreamforce';
                System.debug('::>>' +ld);
            }
        }
        update scope;
        System.debug('::>>' +scope);
    }    
    
    global void finish(Database.BatchableContext bc){
        // System.debug(recordsProcessed + ' records processed. Shazam!');
        
    }    
}