public class EmployeeTriggerHandler {
    public static void checkEmployeeStatus(List<Employee__c> oldList){
        for(Employee__c emp : oldList){
            if(emp.Is_Active__c == true){
                emp.addError('Active Employee Cannot be removed');
            } 
        }
    }
    public static void updateLeftEmpCountOnAcc(List<Employee__c> oldList){
        Set<Id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        List<Employee__c> empList = new List<Employee__c>();
        Map<Id, Account> accIdToAccMap = new Map<Id, Account>();
        Map<Id, Decimal> accIdToTotalCount = new Map<Id, Decimal>();
                  
        for(Employee__c emp : oldList){
            if(emp.Account__c != null){
                accIds.add(emp.Account__c);
                empList.add(emp);
            }
        }
        if(!accIds.isEmpty()){
            accIdToAccMap = new Map<Id, Account>([SELECT Id, Left_Employee_Count__c,Employee_Count__c From Account WHERE Id IN:accIds]);
         }
        if(!empList.isEmpty()){
            for(Employee__c emp: empList){
                if(accIdToAccMap.containsKey(emp.Account__c)){
                    if(accIdToTotalCount.containsKey(emp.Account__c)){
                        Decimal count = accIdToTotalCount.get(emp.Account__c)+1;
                        accIdToTotalCount.put(emp.Account__c, count);
                    }else {
                        accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Employee_Count__c + 1);
                    }
                    
                }
                
            }
                   
        }
        for(Id accId : accIdToTotalCount.keySet()){
            Account acc = new Account();
            acc.id = accId;
            acc.Left_Employee_Count__c = accIdToTotalCount.get(accId);
            acc.Employee_Count__c = acc.Left_Employee_Count__c;
            accToBeUpdated.add(acc);
            
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
            
        }
        
    }
    public static void updateEmployeeCount(List<Employee__c> oldList, Map<Id, Employee__c> newMap){
        Set<Id> accIds = new Set<Id>();
        
        Map<Id, Decimal> accIdToCount = new Map<Id, Decimal>();
        
        for(Employee__c emp : newMap.Values()){
            if(emp.Account__c != null){
               accIds.add(emp.Account__c);
            }
        }
        if(!accIds.isEmpty()){
        	for (AggregateResult ar : [SELECT Account__c accId, COUNT(Id) empCount FROM Employee__c WHERE Account__c IN :accIds GROUP BY Account__c]) {
                accIdToCount.put((Id) ar.get('accId'), (Decimal) ar.get('empCount'));
            }    
		            
        }
        List<Account> accToUpdate = new List<Account>();
        for (Employee__c emp : newMap.values()) {
            if (accIdToCount.containsKey(emp.Account__c)) {
                Decimal empCount = accIdToCount.get(emp.Account__c);
                empCount += emp.Id == null ? 1 : 0; // Increment count if new employee added
                accIdToCount.put(emp.Account__c, empCount);
            }
        }
        
        for (Id accId : accIdToCount.keySet()) {
            Account acc = new Account(Id = accId);
            acc.Employee_Count__c = accIdToCount.get(accId);
            accToUpdate.add(acc);
        }
        
        update accToUpdate;
    }   
}