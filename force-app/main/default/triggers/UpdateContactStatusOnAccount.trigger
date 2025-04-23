trigger UpdateContactStatusOnAccount on Account (after update) {
	AccountTriggerHandler1.updateContactStatuses(Trigger.new, Trigger.oldMap);
}