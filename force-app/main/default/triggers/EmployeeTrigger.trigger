trigger EmployeeTrigger on Employee__c (before delete, after delete, after insert) {
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            EmployeeTriggerHandler.checkEmployeeStatus(Trigger.Old);
        }
        else if(Trigger.isAfter){
            EmployeeTriggerHandler.updateLeftEmpCountOnAcc(Trigger.Old);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            EmployeeTriggerHandler.updateEmployeeCount(Trigger.Old, Trigger.NewMap);
        }
    }
}