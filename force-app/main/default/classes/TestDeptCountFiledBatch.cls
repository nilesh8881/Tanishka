public class TestDeptCountFiledBatch implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT id,(select id from Contacts__r),(select id from Accounts__r),(select id from Cases__r),(select id from Leads__r),
                                         (select id from Opportunities__r),(select id from Students__r) from Department__c]);
    }
    public void execute(Database.BatchableContext BC, List<Department__c> scope){
        Set<Id> stId = new Set<Id>();
        
		     
        for(Department__c dpt : scope){
            system.debug('Acc Size Records '+dpt.Accounts__r.size());
            system.debug('Acc Size Records '+dpt.Contacts__r.size());
            system.debug('Acc Size Records '+dpt.Cases__r.size());
            system.debug('Acc Size Records '+dpt.Leads__r.size());
            system.debug('Acc Size Records '+dpt.Opportunities__r.size());
            system.debug('Acc Size Records '+dpt.Students__r.size());
            
            Department__c dd= new Department__c();
            
            dd.id = dpt.id;
            dd.No_of_Acc__c = dpt.Accounts__r.size();
            dd.No_of_Con__c = dpt.Contacts__r.size();
            dd.No_of_Cas__c = dpt.Cases__r.size();
            dd.No_of_Led__c = dpt.Leads__r.size();
            dd.No_of_Opp__c = dpt.Opportunities__r.size();
            dd.No_of_Stud__c = dpt.Students__r.size();
            
            for(Account acc : dpt.Accounts__r){
                System.debug('acc '+acc);
                stId.add(acc.Id);
                System.debug('::>> '+stId);
            }
            
            
        }  
        update scope;
    }
    public void finish(Database.BatchableContext BC) {
        
    }
}