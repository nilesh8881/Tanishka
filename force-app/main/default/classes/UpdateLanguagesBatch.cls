global class UpdateLanguagesBatch implements Database.Batchable<sobject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return database.getqueryLocator('Select Id, LastName, Languages__c, Level__c FROM Contact');
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope){
        for(Contact con : scope){
            If(con.Level__c == 'Primary'){
            	con.Languages__c = 'English';
            }
        }
        update scope;
    }
    global void finish(Database.BatchableContext Bc){
        
    }
}