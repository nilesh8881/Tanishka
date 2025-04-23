public class DemoSosl {
    public static void testsosl(){
        // List to hold the returned results of sObject generic type
        List<list<Sobject>> invoiceSearchList = new List<list<Sobject>>();
        
        // SOSL query which will search for 'ABC' string in Customer Name field of Invoice Object
        invoiceSearchList = [FIND 'Test Invoice*' IN ALL FIELDS RETURNING APEX_Invoice__c(ID,APEX_Customer__r.Name)];
        
        // Returned result will be printed
		System.debug('Search Result '+invoiceSearchList);
        
        // Program To Search the given string in Invoice and Account object,
        // List to hold the returned results of sObject generic type
		List<List<SObject>> invoiceAndSearchList = new List<List<SObject>>();
        
        // SOSL query which will search for 'ABC' string in Invoice and in Account object's fields
		invoiceAndSearchList = [FIND 'ABC*' IN ALL FIELDS RETURNING APEX_Invoice__c(Id,APEX_Customer__r.Name), Account];
        
        // Returned result will be printed
		System.debug('Search Result '+invoiceAndSearchList);
        
        // This list will hold the returned results for Invoice Object

        APEX_Invoice__c [] searchedInvoice  = ((List<APEX_Invoice__c>)invoiceAndSearchList[0]);
       	// This list will hold the returned results for Account Object
		Account [] searchedAccount = ((List<Account>)invoiceAndSearchList[1]);
		System.debug('Value of searchedInvoice'+searchedInvoice+'Value of searchedAccount'+ searchedAccount);                                        
    }
}