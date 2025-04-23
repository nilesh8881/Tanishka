@isTest
Private class TestRestrictContactByName{
    @isTest static void TestInsert(){
        Contact d = new contact (LastName='INVALIDNAME', FirstName='Error');
        Test.startTest();
        try{
            insert d;
        }
        catch(Exception e){
        Test.stopTest();
        }
    }
}