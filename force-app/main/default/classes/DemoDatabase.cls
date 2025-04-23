public class DemoDatabase {
    
    Public static void insertByDatatabase(){
        // Insert Operation Using Database methods
        // Insert Customer Records First using simple DML Statement. This Customer Record will be
        // used when we will create Invoice Records
        
        APEX_Customer__c objCust = new APEX_Customer__C();
        objCust.Name = 'Patil';
        insert objCust; // Inserting the Customer Records
        
        // Insert Operation Using Database methods
        
        List<APEX_Invoice__c> InvoiceListToInsert = new List<APEX_Invoice__c>();
        
        APEX_Invoice__c objNewInvoice = new APEX_Invoice__c();
        objNewInvoice.Name = 'Nilesh';
        objNewInvoice.APEX_Status__c = 'Pending';
        objNewInvoice.APEX_Customer__c = objCust.id;
        objNewInvoice.APEX_Amount_Paid__c = 1000;
        InvoiceListToInsert.add(objNewInvoice);
        Database.SaveResult[] srList = Database.insert(InvoiceListToInsert, false);
        
        // Database method to insert the records in List
        // Iterate through each returned result by the method
        
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // This condition will be executed for successful records and will fetch the ids 
                // of successful records
                System.debug('Successfully inserted Invoice. Invoice ID: ' + sr.getId());
                // Get the invoice id of inserted Account
            } else {
                // This condition will be executed for failed records
                for(Database.Error objErr : sr.getErrors()) {
                    System.debug('The following error has occurred.');
                    
                    // Printing error message in Debug log
                    System.debug(objErr.getStatusCode() + ': ' + objErr.getMessage());
                    System.debug('Invoice oject field which are affected by the error:' 
                                 + objErr.getFields());
                }
            }
        }
    }
    Public static void updateByDatatabase(){
        // Code to update the records using the Database methods
        List<apex_invoice__c> invoiceList = [SELECT id, Name, APEX_Status__c,
                                             createdDate FROM APEX_Invoice__c WHERE createdDate = today];
        
        // fetch the invoice created today
        List<apex_invoice__c> updatedInvoiceList = new List<apex_invoice__c>();
        for (APEX_Invoice__c objInvoice: invoiceList) {
            if (objInvoice.APEX_Status__c == 'Pending') {
                objInvoice.APEX_Status__c = 'Paid';
                updatedInvoiceList.add(objInvoice);    //Adding records to the list
            }
        }
        
        Database.SaveResult[] srList = Database.update(updatedInvoiceList, false);
        // Database method to update the records in List
        
        // Iterate through each returned result by the method
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // This condition will be executed for successful records and will fetch
                // the ids of successful records
                System.debug('Successfully updated Invoice. Invoice ID is : ' + sr.getId());
            } else {
                // This condition will be executed for failed records
                for(Database.Error objErr : sr.getErrors()) {
                    System.debug('The following error has occurred.');
                    
                    // Printing error message in Debug log
                    System.debug(objErr.getStatusCode() + ': ' + objErr.getMessage());
                    System.debug('Invoice oject field which are affected by the error:' 
                                 + objErr.getFields());
                }
            }
        }
    }
}