public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        for (Account acc : accountsList){
            if(acc.AnnualRevenue <100000){
            String acctRev = acc.Name + ' : ' + acc.AnnualRevenue;
            system.debug(acctRev);
        	}
        }
    }
}