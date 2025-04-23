trigger updateContact on Account (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        parentToChildAccount.phoneContactUpdate(trigger.new);
        
    }
}