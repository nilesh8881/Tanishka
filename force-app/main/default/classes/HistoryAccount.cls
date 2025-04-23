global class HistoryAccount implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
       return Database.getQueryLocator([SELECT Id, Name, Phone, (SELECT Id, AccountId, Field, OldValue, NewValue FROM Account.Histories) FROM Account limit 10]); 
    }
    global void execute(Database.BatchableContext bc, List<AccountHistory> accHis) {
        Set<Id> st = new Set<Id>();
        for (AccountHistory history : accHis) {
            System.debug('::>> ' +history);
        }
    }
    global void finish(Database.BatchableContext bc) {
    }
}