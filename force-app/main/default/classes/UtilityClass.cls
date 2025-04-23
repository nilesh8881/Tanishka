public with sharing class UtilityClass {
    public UtilityClass(){
     
    }
    @AuraEnabled
    public static Map<String,Integer> mapDemo(){
       Map<String,Integer> testMap= new Map<String,Integer>();
       testMap.put('Elba Gherkin',1);
       testMap.put('Reyon Gherkin',2);      
       testMap.put('Smith Gherkin',3);
       return testMap;
    }
    @AuraEnabled
    public static string testName(){
         return'Test Tring';
        
    }
}