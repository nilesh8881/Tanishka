public class DemoAccount1 {
    public static void numberOfAccInsert(String name,String phone,Integer accno){
        List<Account> lst = new List<Account>();
        
        for(Integer i=0; i<accno; i++){
            Account acc = new Account();
            	acc.name = name;
                acc.phone = phone;
                acc.accno__c = accno;
                lst.add(acc);
        }
        insert lst;
        System.debug('>>>>' +lst);
    }
}