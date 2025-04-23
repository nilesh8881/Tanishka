trigger InsertRevenu on Account (before insert, before update, after insert, after update) {
    /*if(Trigger.isInsert && Trigger.isbefore){
        InserRevenuOnAccount.insertRevenue(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isbefore){
        InserRevenuOnAccount.updateRevenue(Trigger.new);
    }*/
    if(Trigger.isUpdate && Trigger.isafter){
        InserRevenuOnAccount.updateContact(Trigger.oldMap, Trigger.newMap);
    }
    /*if(Trigger.isInsert && Trigger.isafter){
        InserRevenuOnAccount.insertCon(Trigger.new);
    }*/
}