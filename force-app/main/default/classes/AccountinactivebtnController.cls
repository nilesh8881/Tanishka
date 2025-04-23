public without sharing class AccountinactivebtnController {
    @AuraEnabled(cacheable=true)
    public static Account getAccountStatus(string accId){
        Account acc =[SELECT Id, Status__c FROM Account WHERE Id =: accId LIMIT 1];
        return acc;
    }

}