public class AccountHistryTrackBatch implements Database.Batchable<sObject>{
    public  Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, name, NameCount__c, (SELECT Id, AccountId, OldValue, NewValue FROM Account.Histories) FROM Account where id!= null ]);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
         List<string> Lst  = new List<string>();
        List<AccountHistory> LstAch  = new List<AccountHistory>();
        for(Account ac : scope){
            for(AccountHistory ach :LstAch ){
            if(ac.name != ach.OldValue){
              Lst.add(ac.name);
        }
    }
   }
        system.debug('Size >>>'+Lst);
   }
    
    public void finish(Database.BatchableContext bc){
        
    } 
  
}