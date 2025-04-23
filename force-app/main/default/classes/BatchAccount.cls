public class BatchAccount implements Database.Batchable<sObject>{

   public Database.QueryLocator start(Database.BatchableContext BC){
      String query = 'Select Id, Name, Contact_Number__c, (SELECT id FROM Contacts) from Account';
     	System.debug('Query ' +query);
      return Database.getQueryLocator(query);
       
   }

   public void execute(Database.BatchableContext BC, List<Account> scope){
       List<Contact> lstc = new List<Contact>();
       for(Account acn : scope){
           System.debug('contact id' +acn.Contacts.size());
           Integer j = acn.Contacts.size();
           Integer con = (Integer)acn.Contact_Number__c;
           
           for(Integer a=j; a<5; a++){
          	 /*for(Integer i=0; i < con ; i++){*/
              	 Contact c = new Contact();
              	 c.LastName = acn.Name;
              	 c.AccountId = acn.Id;
              	 lstc.add(c);
           }
       }
        insert lstc;
   }

   public void finish(Database.BatchableContext BC){
   }
}