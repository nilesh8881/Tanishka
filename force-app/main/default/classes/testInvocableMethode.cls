public class testInvocableMethode {
    @invocableMethod(label='Call Batch' Category = 'Lead')
    public Static void callBatchClass(){
        LeadProcessor bcn = new LeadProcessor() ;
        System.debug('::>>inside class');
        ID batchprocessid = Database.executeBatch(bcn);
    }
}