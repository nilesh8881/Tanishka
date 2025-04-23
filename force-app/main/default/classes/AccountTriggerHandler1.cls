/*
* Account status updated then its related contact status field updated 
* when update record that time new list and oldmap value need to compare so we use list and map 


*/




public class AccountTriggerHandler1 {
    public static void updateContactStatuses(List<Account> newList, Map<Id, Account> oldAccountMap){
	
		set<Id> updateAccountId = new set<Id>();
		
		Map<Id, String> accountStatusMap = new Map<Id, String >();
		
		for(Account acc : newList){
			Account oldAcc = oldAccountMap.get(acc.Id);
			
			if(acc.Status__c != oldAcc.Status__c){
				updateAccountId.add(acc.Id);
                accountStatusMap.put(acc.Id, acc.Status__c);
			}
		}
		if(!updateAccountId .isEmpty()){
			List<Contact> contactUpdate =[ SELECT Id, Status__c, AccountId From Contact Where AccountId IN :updateAccountId];
		
		
			for(Contact con : contactUpdate){
				con.Status__c = accountStatusMap.get(con.AccountId);	
			}
			if(!contactUpdate.isEmpty()){
				try{
					update contactUpdate;
				}
				catch( DmlException e ){
					System.debug('Error Updating Contacts:' +e.getMessage());
				}
			
			}
		
		}
	}
}