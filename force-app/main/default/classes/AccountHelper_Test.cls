@isTest
public class AccountHelper_Test {
    public static testmethod void updateAcc(){
        Account acc =TestDataFactory.createAcoount();
        acc.Rating = 'Hot';
        acc.Type = '';
        acc.Phone = '1234567890';
        acc.Website = 'www.google.com';
        acc.AnnualRevenue = 1000;
        insert acc;
        AccountHelper.getAccountList();
    }
    
}