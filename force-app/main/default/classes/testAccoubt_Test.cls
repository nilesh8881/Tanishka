@isTest
public class testAccoubt_Test {
    @isTest
    public static void InsertUpdtAccField(){
        Account acc = new Account(Name='test13', Industry = 'Banking');
        Account acc1 = new Account(Name='test13', Industry = 'Agriculture');
        try{
            insert acc;
            insert acc1;
        }
        catch(exception e){
            
        }
    }
}