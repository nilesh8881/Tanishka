@isTest
private class MyTestClass 
{
    static testmethod void myUnitTest() 
    {
        Lead leadObj = TestDataFactory.createLead();
        Account accObj = TestDataFactory.createAcoount();
        Contact contObj = TestDataFactory.createContact();
        Opportunity oppObj = TestDataFactory.createOpp();
        
    }
    // If you want to edit data according to apex class then try like below
    static testmethod void myUnitTest1() 
    {
        Lead leadObj = TestDataFactory.createLead(); // pass false
        leadObj.LastName ='MyName';
        insert leadObj ;
        
        Account accObj = TestDataFactory.createAcoount();
        accObj.Name ='MyName';
        insert accObj;
        
    }
    
}