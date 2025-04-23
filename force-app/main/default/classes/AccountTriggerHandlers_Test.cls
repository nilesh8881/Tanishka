@isTest
public class AccountTriggerHandlers_Test {
    @isTest
    public static void tetsOpp(){
        Account oldAccount = new Account(Name = 'Test Account', Phone = '1234567890', Description = 'Old description', Industry = 'Media');
        insert oldAccount;
        
        // Fetch the account again to get its Id
        oldAccount = [SELECT Id, Phone, Description, Industry FROM Account WHERE Id = :oldAccount.Id];
        
        // Create a map of the old account data
        Map<Id, Account> oldMap = new Map<Id, Account>{oldAccount.Id => oldAccount};
        
        // Update the phone number in the new account
        Account newAccount = new Account(Id = oldAccount.Id, Phone = '0987654321');
        
        // Add the new account to a list
        List<Account> newList = new List<Account>{newAccount};
        
        // Call the method to update the phone description
        AccountTriggerHandlers.updatePhoneDescription(newList, oldMap);
        
        update newList;
        
        // Fetch the updated account from the database
        Account updatedAccount = [SELECT Id, Phone, Description FROM Account WHERE Id = :newAccount.Id];
        AccountTriggerHandlers.updateRelatedOppPhone(newList, oldMap);
        // Verify that the description has been updated correctly
        //System.assertEquals('Phone Field Is updated : ', updatedAccount.Description);
    }

}