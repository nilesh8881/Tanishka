public class AccountPhonTriggerHandler {
    public static void afterUpdate(Map<Id, Account> newMapAccount, Map<Id, Account> oldMapAccount){
        List<Account> fetchAccList = new List<Account>();
        for(id accMap: newMapAccount.keyset()){
            if(newMapAccount.get(accmap).Phone!=oldMapAccount.get(accMap).Phone){
                fetchAccList.add(newMapAccount.get(accMap));
            }
        }
        Map<Id,Account>fetchAccContactList =new Map<Id, Account>([Select Id, Phone,(Select Id, Phone FROM Contacts) FROM Account WHERE Id in:fetchAccList]);
         Map<Id,List<Contact>> fetchContacts = new Map<Id,List<Contact>>();
        for(Account acclIst: fetchAccContactList.values()){
            if(!accList.contacts.isEmpty()){
                  fetchContacts.put(acclIst.Id,acclIst.contacts);
            }            
        }
        List<Contact> contactUpdate = new List<Contact>();
           for(Id cseId:fetchContacts.keyset()){
               List<Contact> contactsList = new List<Contact>();
               contactsList = fetchContacts.get(cseId);
               for(Contact cnts:contactsList){
                 
                   Account acc= fetchAccContactList.get(cseId);
                   
                   cnts.phone = acc.Phone;
                   contactUpdate.add(cnts);
               }
           }update contactUpdate;
    }	
}