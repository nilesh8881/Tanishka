trigger insertAccountphon on Account (before insert, before update, after insert ) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.accountValidation(Trigger.New);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.accountValidation(Trigger.New);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.CreateContopp(Trigger.New);
        }
    }
}