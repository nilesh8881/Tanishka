Global class TestDeptBatch implements Database.Batchable<sObject>{ 
    //department is primery obj and account and sutdent child object find count 
   public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT id,Name,Department__c From Account where Department__c != null]);
    }
    public void execute(Database.BatchableContext BC, List<Account> scope){
        set<Id> StDeptId = new set<Id>();
        
        for(Account acc : scope){
            StDeptId.add(acc.Department__c);
        }
        
        // This For CStudent 
        
        List<Students__c> LstStud = [select Id,Department__c from Students__c  where Department__c =:StDeptId]; 
        set<Id> StudId = new set<Id>(); //add dept id in set
        for(Students__c stt : LstStud){
            StudId.add(stt.Id);
        }
        
        Integer countStd = [select count() from Students__c  where Department__c =:StDeptId];// count number of student
        system.debug('Count Value  Stud >>:'+countStd);
        
        system.debug('Id of Student >>:'+StudId);
        system.debug('Id of Student >>:'+StudId.size());
        
        // This For Contact
        
        List<Contact> LstCon = [select id,Department__c from Contact  where Department__c =:StDeptId];
        set<id> ct = new set<id>();
        for(Contact ctt : LstCon){
            ct.add(ctt.id);
        }
        
        Integer countCon = [select count() from Contact  where Department__c =:StDeptId];
        system.debug('Count Value Con >>:'+countCon);
        
        system.debug('Id Of Con  >>:'+ct);
        system.debug('Id Of Con  >>:'+ct.size());
        
        // For Opportunity 
        
        List<Opportunity> LstOpp = [select id,Department__c from Opportunity  where Department__c =:StDeptId];
        set<id> Oppt = new set<id>();
        for(Opportunity Optt: LstOpp){
            Oppt.add(Optt.id);
        }
        
        Integer countOpp = [select count() from Opportunity  where Department__c =:StDeptId];
        system.debug('Count Value Opp >>:'+countOpp);
        
        system.debug('Id Of Opp >>:'+Oppt);
        system.debug('Id Of Opp >>:'+Oppt.size());
        // For Lead 
        
        List<Lead> LstL = [select id,Department__c from Lead  where Department__c =:StDeptId];
        Set<id> Lt = new Set<id>();
        for(Lead Lett: LstL){
            Lt.add(Lett.id);
        }
        
        Integer countLd = [select count() from Lead  where Department__c =:StDeptId];
        system.debug('Count Value Ld >>:'+countLd);
        
        system.debug('Id of Lead >>:'+Lt);
        system.debug('Id of Lead >>:'+Lt.size());
        // For Case
        
        List<Case> LstCas = [select id,Department__c from Case  where Department__c =:StDeptId];
        Set<id> Caset = new Set<id>();
        for(Case Catt: LstCas){
            Caset.add(Catt.id);
        }
        
        Integer countCs = [select count() from Case  where Department__c =:StDeptId];
        system.debug('Count Value Cs>>:'+countCs);
        
        System.debug('Id of Case >>:'+Caset);
        System.debug('Id of Case >>:'+Caset.size());
    }
    public void finish(Database.BatchableContext BC){
    }
}