public class DemoInvoice {
    Public Static void insertInvoice(){
        // fetch the invoices created today, Note, you must have at least one invoice 
        // created today
        List<Apex_Invoice__c> invoiceList = [SELECT id, Name, APEX_Status__c,createdDate FROM Apex_Invoice__c WHERE createdDate = today];
        // create List to hold the updated invoice records
        List<Apex_Invoice__c> updatedInvoiceList = new List<Apex_Invoice__c>();
        APEX_Customer__c objCust = new APEX_Customer__C();
        objCust.Name = 'Customer';
        //DML for Inserting the new Customer Records
        insert objCust;
        for (Apex_Invoice__c objInvoice: invoiceList){
            if(objInvoice.APEX_Status__c == 'Pending'){
                objInvoice.APEX_Status__c = 'Paid';
                updatedInvoiceList.add(objInvoice);
            }
        }
        // DML Statement to update the invoice status
        update updatedInvoiceList;
        // Prints the value of updated invoices
        System.debug('List has been updated and updated values are' + updatedInvoiceList);
        
        // Inserting the New Records using insert DML statement
        Apex_Invoice__c objNewInvoice = new Apex_Invoice__c();
        objNewInvoice.Name = 'Test Invoice';
        objNewInvoice.APEX_Status__c = 'Pending';
        objNewInvoice.APEX_Amount_Paid__c = 1000;
        objNewInvoice.APEX_Customer__c = objCust.id;
        
        // DML which is creating the new Invoice record which will be linked with newly
        // created Customer record
        insert objNewInvoice;
        System.debug('New Invoice Id is '+objNewInvoice.id+' and the Invoice Number is'
                     + objNewInvoice.Name);
    }
    Public static void updateInvoice(){
        // First, fetch the invoice created today
        List<Apex_Invoice__c> invoiceList = [SELECT id, Name, APEX_Status__c,createdDate FROM Apex_Invoice__c];
        List<Apex_Invoice__c> updatedInvoiceList = new List<Apex_Invoice__c>();
        
        // Update the first record in the List
        invoiceList[0].APEX_Status__c = 'Pending';
        updatedInvoiceList.add(invoiceList[0]);
        
        
        // DML Statement to update the invoice status
        update updatedInvoiceList; 
        // Prints the value of updated invoices
        System.debug('List has been updated and updated values of records are' + updatedInvoiceList[0]); 	 	
    }
    Public static void deleteInvoice(){
        // fetch the invoice created today
        List<Apex_Invoice__c> invoiceList = [SELECT id, Name, APEX_Status__c,createdDate FROM Apex_Invoice__c WHERE createdDate = today];
        List<Apex_Invoice__c> updatedInvoiceList = new List<Apex_Invoice__c>();
        APEX_Customer__c objCust = new APEX_Customer__C();
        objCust.Name = 'Test';
        
        // Inserting the Customer Records
        insert objCust;
        for (APEX_Invoice__c objInvoice: invoiceList) {
            if (objInvoice.APEX_Status__c == 'Pending') {
                objInvoice.APEX_Status__c = 'Paid';
                updatedInvoiceList.add(objInvoice);
            }
        }
        
        // DML Statement to update the invoice status
        update updatedInvoiceList;
        
        // Prints the value of updated invoices
        System.debug('List has been updated and updated values are' + updatedInvoiceList);
        
        // Inserting the New Records using insert DML statement
        APEX_Invoice__c objNewInvoice = new APEX_Invoice__c();
        objNewInvoice.APEX_Status__c = 'Pending';
        objNewInvoice.APEX_Amount_Paid__c = 1000;
        objNewInvoice.APEX_Customer__c = objCust.id;
        
        // DML which is creating the new record
        insert objNewInvoice;
        System.debug('New Invoice Id is' + objNewInvoice.id);
        
        // Deleting the Test invoices from Database
        // fetch the invoices which are created for Testing, Select name which Customer Name
        // is Test.
        List<Apex_Invoice__c> invoiceListToDelete = [SELECT id FROM APEX_Invoice__c
                                                     WHERE APEX_Customer__r.Name = 'Test'];
        
        // DML Statement to delete the Invoices
        delete invoiceListToDelete;
        System.debug('Success, '+invoiceListToDelete.size()+' Records has been deleted');
    }
    Public static void undeleteInvoice(){
        // fetch the invoice created today
        List<Apex_Invoice__c> invoiceList = [SELECT id, Name, APEX_Status__c,
                                             createdDate FROM APEX_Invoice__c WHERE createdDate = today];
        List<Apex_Invoice__c> updatedInvoiceList = new List<Apex_Invoice__c>();
        APEX_Customer__c objCust = new APEX_Customer__C();
        objCust.Name = 'Test';
        
        // Inserting the Customer Records
        insert objCust;
        for (APEX_Invoice__c objInvoice: invoiceList) {
            if (objInvoice.APEX_Status__c == 'Pending') {
                objInvoice.APEX_Status__c = 'Paid';
                updatedInvoiceList.add(objInvoice);
            }
        }
        
        // DML Statement to update the invoice status
        update updatedInvoiceList;
        
        // Prints the value of updated invoices
        System.debug('List has been updated and updated values are' + updatedInvoiceList);
        
        // Inserting the New Records using insert DML statement
        APEX_Invoice__c objNewInvoice = new APEX_Invoice__c();
        objNewInvoice.APEX_Status__c = 'Pending';
        objNewInvoice.APEX_Amount_Paid__c = 1000;
        objNewInvoice.APEX_Customer__c = objCust.id;
        
        // DML which is creating the new record
        insert objNewInvoice;
        System.debug('New Invoice Id is '+objNewInvoice.id);
        
        // Deleting the Test invoices from Database
        // fetch the invoices which are created for Testing, Select name which Customer Name
        // is Test.
        List<Apex_Invoice__c> invoiceListToDelete = [SELECT id FROM APEX_Invoice__c
                                                     WHERE APEX_Customer__r.Name = 'Test'];
        
        // DML Statement to delete the Invoices
        delete invoiceListToDelete;
        system.debug('Deleted Record Count is ' + invoiceListToDelete.size());
        System.debug('Success, '+invoiceListToDelete.size() + 'Records has been deleted');
        
        // Restore the deleted records using undelete statement
        undelete invoiceListToDelete;
        System.debug('Undeleted Record count is '+invoiceListToDelete.size()+ '. This should be same as Deleted Record count');
    }
}