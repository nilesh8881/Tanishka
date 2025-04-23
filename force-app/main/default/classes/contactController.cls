public with sharing class contactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContactFieldSetData(){
        String queryString = 'SELECT Id';
        List<Contact> conList = new List<Contact>();

        for(Schema.FieldSetMember fld :SObjectType.Contact.FieldSets.Contact_Search_Fields.getFields()) {
            queryString += ', ' + fld.getFieldPath();
        }

        queryString += ' FROM Contact LIMIT 10';
         
        conList = Database.query(queryString);
        return conList;
    }

    @AuraEnabled(cacheable=true)
    public static String getFieldSet(String sObjectName, String fieldSetName) {
        String result = '';
        try{
            SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
            Schema.DescribeSObjectResult d = objToken.getDescribe();
            Map<String, Schema.FieldSet> fieldSetMap = d.fieldSets.getMap();

            if(fieldSetMap.containsKey(fieldSetName)){
                for(Schema.FieldSetMember f : fieldSetMap.get(fieldSetName).getFields()) {
                     
                    if(String.isNotBlank(result)){
                        result += ',';
                    }

                    String jsonPart = '{';
                    jsonPart += '"required":"' + (f.getDBRequired() || f.getRequired()) + '",';
                    jsonPart += '"type":"' + (f.getType()) + '",';
                    jsonPart += '"label":"' + (f.getLabel()) + '",';
                    jsonPart += '"name":"' + f.getFieldPath() + '"';
                    jsonPart += '}';
                    result += jsonPart;
                }
            }
        }
        catch(Exception ex){
            result += ex.getLineNumber() + ' : ' + ex.getMessage();
        }
        return '['+result+']';
    }

    @AuraEnabled(cacheable=true)
    public static list<contact> getContactList(string searchKey) {
        string searchKeyword = '%' + searchKey + '%';
		
       // create contact list to store search result 
        list<contact> contactListRecord = new list<contact>();
     
	   // query contact records
        for(contact conObj : [Select id,Name,Email,FirstName,LastName,Phone
                            From Contact
                            WHERE name LIKE : searchKeyword]){
           contactListRecord.add(conObj);
        }
        
         if(contactListRecord.size() == 0){
            throw new AuraHandledException('No Record Found..'); 
         }
         
        return contactListRecord;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> searchContacts(String searchKey) {
        String searchTerm = '%' + searchKey + '%';
        List<Contact> contacts = [SELECT Id, Name, Email, Phone FROM Contact WHERE Name LIKE :searchTerm OR Email LIKE :searchTerm OR Phone LIKE :searchTerm];
        return contacts;
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, Name, Phone, Email FROM Contact];
    }
    
    @AuraEnabled
    public static void deleteContact(String contactId) {
        try {
            Contact contactToDelete = new Contact(Id = contactId);
            delete contactToDelete;
        } catch (Exception e) {
            throw new AuraHandledException('Error deleting contact: ' + e.getMessage());
        }
    }
}