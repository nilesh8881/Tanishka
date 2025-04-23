public with sharing class ContactAuraService {
    public ContactAuraService() {

    }
    @AuraEnabled(cacheable=true)
    public static List<sObject> getContactList(String name){
        String key = '%' +name+ '%';
        String Query = 'Select Id, Name, Email, phone From Contact Where Name LIKE : key';
        return Database.query(query);
    }
    @AuraEnabled(cacheable=true)
    public static List<sObject> getAccountList(String name){
        String key = '%' +name+ '%';
        String Query = 'Select Id, Name, Industry From Account Where Name LIKE : key';
        return Database.query(query);
    }
}