global class AccountBatchUpdate implements Database.Batchable<sObject> {
     global  Database.QueryLocator start(Database.BatchableContext BC){
         string query='SELECT Id,Name,Type FROM Account WHERE Name=Nilesh ';
         system.debug('query' +query);
         return Database.getQueryLocator(query);
     }
     global void execute(Database.BatchableContext BC, List<Account> scope){
         
         delete scope;
         /*for(Account a:scope){
             a.Type='Prospect';
         } update scope;*/
     }
     global void finish(Database.BatchableContext BC){
         system.debug('Account update batch');
     }
}