public class q346460 implements Database.Batchable<sObject> {
    @InvocableMethod(Label = 'Demo Class' description='Demo'Category = 'Account') public static String[] doThing(String[] input) {
        Database.executeBatch(new q346460());
        return input;
    }
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator([SELECT Id FROM Account]);
    }
    public void execute(Database.BatchableContext context, Account[] scope) {
        
    }
    public void finish(Database.BatchableContext context) {
        
    }
}