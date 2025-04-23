public with sharing class AccountController {
  @AuraEnabled (cacheable=true)
  public static List<Contact> getContacts(String accountId){
    return [SELECT Id, Name, phone FROM Contact WHERE AccountId =:accountId];        
    }
    @AuraEnabled( cacheable = true ) 
    public static List< Account > getAccList() { 
      
        return [ SELECT Id, Name, phone, Industry FROM Account LIMIT 4 ]; 
         
    } 
    @AuraEnabled (cacheable=true)
    public static List<Account> getAccountLocations(){
        return[SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry 
                FROM Account
                WHERE isDisplay__c = true];
    }
    /*public static List<Account> getAllActiveAccounts() {
      return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    }*/
  }