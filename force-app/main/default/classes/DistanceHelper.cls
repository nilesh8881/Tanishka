public class DistanceHelper {
    @AuraEnabled
    public static list<String> getDistance(String ConId) {
        
        list<String> resList = new list<String>();
        String endpoint = 'https://maps.googleapis.com/maps/api/distancematrix/json?';
        String apikey = 'AIzaSyADFxf2L7tKEtNRhVe9X1ZscvJRj372woY';
        contact c = [SELECT Id, account.billingcity, mailingcity FROM Contact Where Id =:ConId];
        String conCity = c.MailingCity;
        String accCity = c.Account.billingcity;
        system.debug(c);
        String mainUrl = endpoint +'origins='+ conCity +'&destinations='+ accCity +'&key='+ apikey;
        system.debug(mainUrl);    
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(mainUrl);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        System.debug('response:--> ' + res.getBody());
        JSONParser parser =  JSON.createParser(res.getBody());
        while (parser.nextToken() != null) {
            if(parser.getText() == 'text') {
                System.debug('distance2'+ parser.getText());
                system.debug('Main temp_min-->' + parser.nextValue());
                resList.add(parser.getText());
                system.debug('Main temp_min--> ' + parser.nextValue());
            }
        }
        system.debug(resList);
        return resList;
    }
}