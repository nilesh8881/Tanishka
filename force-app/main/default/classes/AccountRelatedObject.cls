public with sharing class AccountRelatedObject {
    @auraEnabled(cacheable=true)
    public static List<Account> fetchAccount()
    {
        List<Account> accList=[SELECT Id,Name FROM Account LIMIT 10000];
        return accList;
    }
    @auraEnabled
    public static List<Contact> getContacts(String accountId)
    {
        List<Contact> conList=[SELECT Id,LastName,Email,FirstName,Phone, AccountId FROM Contact WHERE AccountId=:accountId ];
        return conList;
    }
    
}