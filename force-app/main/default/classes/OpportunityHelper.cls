/*
**Business Use Case: 
*A Sales Organization wants to track the largest Opportunity associated with each of its Accounts.
*This information could be used to prioritize sales efforts, allocate resources, or identify opportunities for cross-selling or upselling.
*/
public class OpportunityHelper {
    public static void updateMaxOpportunity(Set<Id> accountIds) {
        Map<Id, Opportunity> largestOpportunities = new Map<Id, Opportunity>();
        
        for (AggregateResult ar : [
            SELECT AccountId, MAX(Amount) maxAmount
            FROM Opportunity
            WHERE AccountId IN :accountIds AND IsClosed = FALSE
            GROUP BY AccountId
        ]) {
            Id accountId = (Id) ar.get('AccountId');
            Decimal maxAmount = (Decimal) ar.get('maxAmount');
            
            Opportunity largestOpp = [
                SELECT Id, Name
                FROM Opportunity
                WHERE AccountId = :accountId AND Amount = :maxAmount AND IsClosed = FALSE
                LIMIT 1
            ];
            
            if (largestOpp != null) {
                largestOpportunities.put(accountId, largestOpp);
            }
        }
        
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : largestOpportunities.keySet()) {
            Opportunity opp = largestOpportunities.get(accountId);
            accountsToUpdate.add(new Account(Id = accountId, maxOpp__c = opp.Name));
        }
        
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}