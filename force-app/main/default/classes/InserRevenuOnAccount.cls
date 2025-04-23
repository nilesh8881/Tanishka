public class InserRevenuOnAccount {
    // Before insert Account 
   /* public static void insertRevenue(List<Account>newLst){
        List<account> acct = new List<account>();
        for(Account ac:newLst){
            if(	ac.AnnualRevenue == null){
                ac.AnnualRevenue = 1000;
                ac.Rating = 'Hot';
                acct.add(ac);
            }
            
        }
        
    }
    //before update any account field
    public static void updateRevenue(List<Account>newLst){
        List<account> acc1 = new List<account>();
        for(Account ac:newLst){
            if(	ac.AnnualRevenue != null){
                ac.AnnualRevenue = 5000;
                ac.Rating = 'cold';
                acc1.add(ac);
            }
            
        }
        
    }
    //After insert new account add related contact
    public static void insertCon(List<Account>newLst){
        List<Contact> ct = new List<Contact>();
        for(Account acc:newLst){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            ct.add(con);
            
        }
        insert ct;
    }*/
    public static void updateContact(Map<id, Account> oldMap, Map<id, Account> newMap){
        //fetch account who's phone field value != old Value
        List<Account> fetchAcc = new List<Account>();
        for(id accmap : newMap.keySet()){
            if(newMap.get(accmap).Phone!=oldMap.get(accMap).Phone){
                fetchAcc.add(newMap.get(accMap));
            }
            //account related Contact if contact isempty
            Map<Id, Account> fetchContact =new Map<Id, Account>([Select Id, Phone,(SELECT Id, Phone FROM Contacts) FROM Account WHERE Id IN:fetchAcc]);
            Map<Id,List<Contact>> fechcon = new Map<Id,List<Contact>>();
            for(Account acclst: fetchContact.values()){
                if(!acclst.contacts.isEmpty()){
                    fechcon.put(acclst.Id,acclst.contacts);
                } 
                List<Contact> contactsList = new List<Contact>();
                List<Contact> contactUpdate = new List<Contact>();
                for(Id cseId:fechcon.keyset()){
                    
                    contactsList = fechcon.get(cseId);
                    for(Contact cnts:contactsList){
                        
                        Account acc= fetchContact.get(cseId);
                        
                        cnts.phone = acc.Phone;
                        contactUpdate.add(cnts);
                    }
                }update contactUpdate;           
            }
        }
        
    }
    
}