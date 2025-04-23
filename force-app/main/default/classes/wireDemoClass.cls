public class wireDemoClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        List<Account> acc = [SELECT ID, Name, Industry FROM Account];
        System.debug('Account Record -'+acc);
        return acc;
    }


}