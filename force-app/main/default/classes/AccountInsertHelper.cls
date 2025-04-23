public class AccountInsertHelper {
    
    public static void insertAcc(List<Account> lstass){
        
        List<Account> accList = new List<Account>();
        
        for (Account acc: lstass){
            
            if(acc.Name == 'Pritesh'){
                acc.BillingCity  = 'Pune';
            }
        }
        
    }
    //if contact count  10 then insert 10 records Related account before insert
    public static void countConInsert(List<Account> lstacc){
        List<Contact> lstcon = new List<Contact>();
        List<Opportunity> lstOpp = new List<Opportunity>();
        
        for(Account acc : lstacc){
            for(integer i=1; i<=acc.ConCount__c; i++){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.name; 
                lstcon.add(con);
            }
            
            for(integer i=1; i<=acc.OppCount__c; i++){
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.Id;
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = System.today();
                lstOpp.add(opp);    
                
            } 
        }
        insert lstcon;
        insert lstOpp; 
    }
    
    
    public static void CountContactHelper(List<contact> newcontact, List<contact> oldcontact){
        set<id> accIds= new set<id>();
        System.debug('::>> ' +accIds);
        if(newcontact != null){
            for(Contact c : newcontact){
                if(c.AccountId!=null){
                    accIds.add(c.accountid);
                }
            }      
        }
        
        if(oldcontact != null){
            for(Contact c : oldcontact){
                accIds.add(c.accountid);
            }
        }
        
        List<Account> accList = [Select Id, ConCount__c, (Select id from Contacts) from Account where Id IN :accIds];
        System.debug(':::>>' +accList);
        if(accList!=null){
            for(Account acc : accList){
                acc.ConCount__c = acc.Contacts.size();
            } 
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
    } 
    /*public static void demoacc(List<Account> lstAcc, Map<id,Account> mpAcc){
        // when Acc field is updated atomatically contact created 
        List<Contact> lstCon = new List<Contact>();
        system.debug('List Given For Conatct >>:');
     
        for(Account acc:lstAcc){
             system.debug('IN Loop >>:');

            if(acc.Type!=null && acc.Type!=mpAcc.get(acc.id).Type){
                 system.debug('In Condition >>:');

                Contact con = new Contact();
                con.AccountId = acc.id;
                con.LastName = acc.Name;
                lstCon.add(con);  
            }
        } 
        insert lstCon;
         system.debug('Insert Contact >>:'+lstCon);
    }
    public static void upcon(List<Account> lstAcc, Map<id,Account> mpacc){
        //if old type is prospect then create contact 
        List<Contact> lstac = new List<Contact>();
        
        for(Account acc :lstAcc ){
            
            if(acc.Type=='Prospect' && mpacc.get(acc.id).Type!='Prospect') {
                
				Contact con = new Contact();
                con.AccountId = acc.id;
                con.LastName = acc.Name;
                lstac.add(con);     
            }
        }   
        insert lstac;
    } */ 
}