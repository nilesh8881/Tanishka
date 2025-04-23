public class foreachDemoClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
       List<Account> listOfAcc = [SELECT Id, Name FROM Account LIMIT 5];
       return listOfAcc;
    }

}