Public class OpportunityBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext BC){
      String query = 'Select Id, Name,OldOpp__c,CloseDate  from Opportunity';
     	System.debug('Query ' +query);
      return Database.getQueryLocator(query);
       
   }

   public void execute(Database.BatchableContext BC, List<Opportunity> opps){
        List<Opportunity> listRecords = new List<Opportunity>();
       for(Opportunity opp : opps){
           if(opp.CloseDate!=date.today()){
               opp.OldOpp__c = True;
           }
           update opps;
   }
   }

   public void finish(Database.BatchableContext BC){
   }
}