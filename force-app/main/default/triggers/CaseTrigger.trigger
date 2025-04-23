trigger CaseTrigger on Case (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        CaseTriggerHandler.populateCaseTestNum(Trigger.New);
    }
}