public class GlobalSearchHandler{
    
    @AuraEnabled(cacheable=true)
    public static List<List<sObject>> getSearchRecords(String searchKey){      
        List<List<sObject>> searchResult = [FIND :searchKey IN ALL FIELDS RETURNING
                                            Account (Id, Name, AccountNumber, Website),
                                            Contact(Id, Name, Email, MobilePhone),
                                            Opportunity(Id, Name, StageName, CloseDate),
                                            Lead(Id, Name, Email, Company)];
        return searchResult;
        
    }
}