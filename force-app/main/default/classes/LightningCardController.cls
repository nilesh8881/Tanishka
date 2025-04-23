public with sharing class LightningCardController {
    
    @AuraEnabled( cacheable = true )  
    public static List < Case > fetchRecs( String strAccId ) {  
        
        List < Case > listRecs = new List < Case >();
        String strSOQL = 'SELECT Id, Subject, Status, Origin FROM Case';

        if ( String.isNotBlank( strAccId ) )
            strSOQL  += ' WHERE AccountId = \'' + strAccId + '\'';
        
        strSOQL += ' LIMIT 3';
        system.debug( 'SOQL is ' + strSOQL );
        listRecs = Database.query( strSOQL );
        return listRecs;
          
    }

}