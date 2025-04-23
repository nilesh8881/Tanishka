public with sharing class CustomObjectController {
    @AuraEnabled
    public static Schedule__c createCustomObject(Schedule__c newCustomObjRecord) {
       insert newCustomObjRecord;
       return newCustomObjRecord;
    }

    @AuraEnabled(cacheable=true)
    public static List<Schedule__c> getSchedules() {
        return [SELECT Day__c, Start_Time__c, Duration__c, Subject__c, Status__c FROM Schedule__c];
    }
    
}