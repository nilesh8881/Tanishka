public class imparativeDemoClass {
    @AuraEnabled
    public static List<Account> getAccountList(){
        List<Account> acc = [SELECT Id, Name From Account limit 5];
        System.debug('Account:-' +acc);
        return acc;
    }


}