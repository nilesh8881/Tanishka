@isTest
public class MyDataGenerationTests {
    @TestSetup
    public static void testMyDataGeneration(){
        List<SObject> accounts = test.loadData(Account.SObjectType, 'otherAccountData');
    }
    @isTest
    public static void testLoadOtherAccountsFromStaticResource(){
        List<Account> acct = [SELECT Id FROM Account];
        System.debug('Number of accounts queried: ' + acct.size());
        System.debug('Queried Accounts: ' + acct);
        Assert.isTrue(acct.size() == 15, 'Expected 15 accounts');
    }
}