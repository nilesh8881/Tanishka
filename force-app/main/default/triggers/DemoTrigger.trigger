trigger DemoTrigger on Account (after update, after Insert) {
    
    /*if( Trigger.isupdate ){ 
        AccountInsertHelper.demoacc(Trigger.New,Trigger.oldmap);
    }*/
    
    
   /*if(Trigger.isinsert){ 
        AccountInsertHelper.demoacc(Trigger.New, Trigger.oldmap);
        system.debug('TriggerNew :'+Trigger.New);
    }*/
     /*if( Trigger.isupdate){
        if(Trigger.isafter){
      
        DemoTriggerHandler.upcon(Trigger.New,Trigger.oldmap);
        system.debug('TriggerNew :'+Trigger.New);
        }
    }*/
}