trigger TriggerOnContact on Contact (before insert, before update, after update) {
    /*if(Trigger.isbefore && Trigger.isInsert){
        ContactCheck.checkInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        ContactCheck.checkUpdate(Trigger.new,Trigger.oldMap);
    }*/
    if(Trigger.IsAfter && Trigger.isUpdate){
    parentToChildAccount.updateContactphone1(trigger.new);
    }
}