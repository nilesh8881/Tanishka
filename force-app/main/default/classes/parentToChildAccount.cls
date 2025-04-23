public class parentToChildAccount {
    //Parent to child 
   public static void  phoneContactUpdate(List<Account> accList){
        List<Contact> contactsToUpdate = new List<Contact>();
        
        for (Account acc : accList) {
            List<Contact> relatedContacts = [SELECT Id, Phone FROM Contact WHERE AccountId = :acc.Id];
            for (Contact con : relatedContacts) {
                con.Phone = acc.Phone;
                contactsToUpdate.add(con);
            }
        }
        update contactsToUpdate;
    }
    //Child to parent 
    public static void updateContactphone1(List<Contact> conList){
        Set<Id> setId = new Set<Id>();
        for(Contact con :conList){
            setId.add(con.AccountId);
        }
        system.debug('setId ' + setId);
        
        List<Account> accList =[Select Id, Name, Phone,(Select Id, LastName, Phone, AccountId From Contacts) From Account Where Id IN:setId];
        for(Account ac:accList){
            for(Contact cl:ac.Contacts){
                if(cl.Phone !=null){
                    ac.Phone = cl.Phone;
					update accList;                   
                }
            }
        }
    }
}