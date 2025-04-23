public class ApexHoursFlowSeries {
    @invocableMethod(label='Delete Related Opportunities'
                     Description = 'Delete Related Opportunities for the given Record IDs'
                     Category = 'Account')
    public Static void  deleteOpportunities(List<String>ids){
        List<Opportunity> oppList =[ SELECT Id FROM Opportunity WHERE AccountId in:ids AND StageName= 'Closed Won'];
        System.debug('::>>' +oppList);
        delete oppList;
    }
}