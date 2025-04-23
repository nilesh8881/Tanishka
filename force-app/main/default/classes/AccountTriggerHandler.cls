public class AccountTriggerHandler {
    public Static void accountValidation(List<Account> lstAcc){
        for(Account acc :lstAcc ){
            /*Integer numberOfNameCharacter = acc.Name.replaceAll('[^A-Za-z .]','').length();
            if((acc.Name.replaceAll('[^A-Za-z .]','')).length() != 15 
               || (acc.AccountNumber.replaceAll('[^A-Za-z .]','')).length() != 8 
               || (acc.Phone.replaceAll('[^A-Za-z .]','')).length() != 10){
                acc.addError('The enter accounts Name must is 15 chanracter, Account number is 8 digit and Phone Number is 10 digit');
            }*/
            if(acc.Phone.length() != 10)
           {
            acc.adderror('Phone number should have 10 digits,please enter valid phone number');
           }
            if(acc.AccountNumber.length() != 8)
           {
               acc.adderror('Account number should consists of 8 digits,please enter valid account  number');
           }
            if(acc.Name.length() >=15)
           {
               acc.adderror('Account name should consists of 15 alphabets,please enter valid name');
           }
        }        
    }
    public Static Void CreateContopp(List<Account> lstAcc){
        List<Contact> lstCon = new List<Contact>();
        List<Opportunity> lstOpp =new List <Opportunity>();
        for(Account acct : lstAcc){
            Contact con = new Contact();
            con.LastName =acct.Name;
            con.AccountId = acct.id;
            lstCon.add(con);
            
            Opportunity opp = new Opportunity();
            opp.CloseDate = date.today();
            opp.Name = acct.Name;
            opp.StageName = 'Qualification';
            opp.AccountId = acct.id;   
            lstOpp.add(opp);
            
        }
        insert lstCon;
        insert lstOpp;
    }
}