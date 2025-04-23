@isTest
public class EmployeeTriggerHandler_Test {
    @isTest
    public static void testCheckEmployeeStatus(){
        Account testAccount = new Account(Name = 'Test Account', Left_Employee_Count__c = 1, Employee_Count__c = 1);
        insert testAccount;
        Company__c comp = new Company__c(Name = 'IBM');
        insert comp;
        
        Employee__c emp1 = new Employee__c(Account__c = testAccount.Id, Company__c = comp.Id, Is_Active__c = true);
        Employee__c emp2 = new Employee__c(Account__c = testAccount.Id, Company__c = comp.Id, Is_Active__c = true);
        insert new List<Employee__c>{emp1, emp2};
            
        Test.startTest();
        EmployeeTriggerHandler.checkEmployeeStatus(new List<Employee__c>{emp1, emp2});
        Test.stopTest();
        
    }
    @isTest
    public static void testUpdateLeftEmpCountOnAcc() {
        Account testAccount = new Account(Name = 'Test Account', Left_Employee_Count__c = 1, Employee_Count__c = 1);
        insert testAccount;
        Company__c comp = new Company__c(Name = 'IBM');
        insert comp;
        
        Employee__c emp1 = new Employee__c(Account__c = testAccount.Id, Company__c = comp.Id, Is_Active__c = false);
        Employee__c emp2 = new Employee__c(Account__c = testAccount.Id, Company__c = comp.Id, Is_Active__c = false);
        insert new List<Employee__c>{emp1, emp2};
            
        Test.startTest();
        EmployeeTriggerHandler.updateLeftEmpCountOnAcc(new List<Employee__c>{emp1, emp2});
        
        Test.stopTest();
        
        Account updatedAccount = [SELECT Left_Employee_Count__c, Employee_Count__c FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(3, updatedAccount.Employee_Count__c);
        System.assertEquals(3, updatedAccount.Left_Employee_Count__c);

        
    }
}