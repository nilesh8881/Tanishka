trigger campaginTrigger on Campaign (after insert, after update, after delete) {
    if (trigger.isAfter){
        system.debug('Entre Trigger');
        campaignTriggerHandler.updateCompaignrealetedOrder(trigger.new);        
    }
}