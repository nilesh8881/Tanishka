/*Phone field updated then add in description Phone is updated old value , and new value phone*/
public class AccountTriggerHandlers {
    public static void updteRating(List<Account> accList){
        try{
            for(Account acc: accList){
                if(acc.Industry != null && acc.Industry == 'Media'){
                    acc.Rating = 'Hot';
                }else{
                    acc.Rating = 'Cold';
                }
            }
        }Catch(exception e){
            
        }
    }
    public static void createdRelatedOpp(List<Account> newList){
        List<Opportunity> newOpp = new List<opportunity>();
        
        for(Account acc : newList){
			Opportunity  opp = new Opportunity();
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name;
           	newOpp.add(opp); 
                       
        }
        if(!newOpp.isEmpty()){
            insert newOpp;
            
        }
        
    }
    // phone field updated description also updataed
    public static void updatePhoneDescription(List<Account> newList, Map<Id, Account> oldMap){
        for(Account acc : newlist){
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone){// old account avalabl asl pahije and old acccha phon no not equal to new phon no 
                acc.Description = 'Phone Field Is updated : ';
            } 
        }
    }
    public static void updateRelatedOppPhone(List<Account> newList, Map<Id, Account> oldMap){
        Map<Id,Account> newAccMap = new Map<Id, Account>();
        List<Opportunity> oppTobeUpdated = new List<Opportunity>();
        
        for(Account acc : newList){
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone){
                newAccMap.put(acc.Id, acc);
            }
        }
        for(Opportunity opp : [SELECT Id, Account_Related_Phone__c, AccountId From Opportunity WHERE AccountId IN :newAccMap.keySet()]){
            Opportunity oopp = new Opportunity();
            if(newAccMap.containsKey(opp.AccountId)){
                oopp.Id = opp.Id;
                oopp.Account_Related_Phone__c = newAccMap.get(opp.AccountId).Phone;
                oppTobeUpdated.add(oopp);
                
            }
            
        }
        if(!oppTobeUpdated.isEmpty()){
            update oppTobeUpdated; 
        }
        
    }
    
}