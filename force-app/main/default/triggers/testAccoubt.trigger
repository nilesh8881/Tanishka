trigger testAccoubt on Account (before insert, before update) {
    if(trigger.isExecuting && trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        for(account ac:Trigger.new){
            if(ac.Industry=='Banking'){
            ac.Fax='200';
            }else{
                ac.Fax='500';
            }
        }
    }
}