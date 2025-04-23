public with sharing class WrapperDemo {







    public class AccountContactWrapperClass{
        @AuraEnabled
        public Account acc;

        @AuraEnabled
        public Integer totalContacts;

        @AuraEnabled
        public String billingAddress;

        @AuraEnabled
        public String type;

        @AuraEnabled
        public String accountName;

        @AuraEnabled
        public String accountLink;

    }

}