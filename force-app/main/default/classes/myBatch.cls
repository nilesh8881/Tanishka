global class myBatch implements Database.Batchable<sObject> {
      global Database.QueryLocator start(Database.BatchableContext BC){
          string query='select id from account';
          system.debug('string query ='+query);
      return Database.getQueryLocator(query);
}
 global void execute(Database.BatchableContext BC, List<account> scope){
     for(account acc:scope){
         acc.name='';
         acc.Temperature__c=20;
       update acc; 
     }
 }
      global void finish(Database.BatchableContext BC){}
  }