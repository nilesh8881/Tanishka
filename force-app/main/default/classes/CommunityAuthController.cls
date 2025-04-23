global without sharing class CommunityAuthController {
    public CommunityAuthController() {

    }

    @AuraEnabled
    global static string doLogin(String username, String password){
        try {
            
            String startUrl = Label.Community_Url;
            ApexPages.PageReference pageRef = Site.login(username, password, startUrl);

            if(pageRef != null) return pageRef.getUrl();

            throw new CalloutException();

            //return null;


        } catch (Exception e) {
            system.debug('e.getMessagelogin+   '+e.getMessage());
            throw new AuraHandledException(e.getMessage());

            //return null;
        }
    }


    @AuraEnabled
    global static boolean isEmailExist(String username){
        try {
            
            List<User> userList = new List<User>();
            userList = [Select Id, Name From User Where Username = :username];

            throw new CalloutException();

           // return !userList.isEmpty();


        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());

           // return null;
        }
    }
}