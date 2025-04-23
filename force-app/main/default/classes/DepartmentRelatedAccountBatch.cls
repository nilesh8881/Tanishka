public class DepartmentRelatedAccountBatch implements Database.Batchable<sObject> {
public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT id FROM Department__c]);
    }
    public void execute(Database.BatchableContext BC, List<Department__c> scope){
        Set<Id> stDept = new Set<Id>();
        Set<Id> stAcc = new Set<Id>();
        
        for(Department__c dpt : scope){
            stDept.add(dpt.Id);
        }
        List<Account> lstAcc = [Select Id, Department__c FROM Account WHERE Department__c =:stDept];
        Map<Id, List<Account>> mpAcc = new Map<Id, List<Account>>();
        for(Account acc : lstAcc){
            stAcc.add(acc.Id);
            If(!mpAcc.containsKey(acc.Department__c)){
                List<Account> accountList = new List<Account>();
                accountList.add(acc);
                System.debug('accountList '+accountList.Size());
            }else{
                List<Account> AccountLst = mpAcc.get(acc.Department__c);
                AccountLst.add(acc);
                System.debug('AccountLst '+AccountLst.Size());
            }
        }
        System.debug('Size of Account' +stAcc.Size());
        
        
        
    } 
    public void finish(Database.BatchableContext BC) {
        
    }
}