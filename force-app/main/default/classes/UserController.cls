public with sharing class UserController {
    @AuraEnabled
    public static void updateUserCheckbox(Boolean isChecked) {
        Id userId = UserInfo.getUserId();
        User userToUpdate = [SELECT Id FROM User WHERE Id = :userId LIMIT 1];
        userToUpdate.Is_logged_in__c = isChecked;
        update userToUpdate;
    }
}