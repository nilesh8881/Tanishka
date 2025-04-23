/* when create new CASE realated account latest account number field set case number*/
public class CaseTriggerHandler {
    public static void populateCaseTestNum(List<Case> lstCase){
        try{
            List<Account> accList = new List<Account>();
            
            for(Case cs : lstCase){
                if(cs.AccountId != null){
                    Account acc = new Account();
                    acc.Id = cs.AccountId;
                    acc.Latest_Case_Number__c = cs.CaseNumber;
                    accList.add(acc);
                }
            }
            if (!accList.isEmpty()) {
                update accList;
            }
            
        }Catch(Exception e){
            
        }
    }
}