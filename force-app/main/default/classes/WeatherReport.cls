public class WeatherReport {
    public String city {get;set;}
	public String temp {get;set;}
	public String pressure {get;set;}
	public String humidity {get;set;}
	public String temp_min {get;set;}
	public String temp_max {get;set;}
    
    

	public WeatherReport(ApexPages.StandardController stdController) {
		Account account = (Account)stdController.getRecord();
		//account = [SELECT Id, BillingCity  FROM Account WHERE ID =: Account.Id limit 1];
        system.debug('::>>' +account);
		account = [SELECT Id, BillingCity FROM Account WHERE Id ='0015g00000PuDTLAA3'];
        
		String accountCity = account.BillingCity;
		String apiKey = '0284633ceb975c6164fa90f016d87e02';

		String requestEndpoint = 'https://api.openweathermap.org/data/2.5/weather';
		requestEndpoint += '?q=' + accountCity;
		requestEndpoint += '&units=metric';
		requestEndpoint += '&APPID=' + apiKey;
		
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(requestEndpoint);
		request.setMethod('GET');
		HttpResponse response = http.send(request);

		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() == 200) {

		   // Deserialize the JSON string into collections of primitive data types.
		  Map<string,object> results=( Map<string,object>)JSON.deserializeUntyped(response.getBody());
           // city=string.valueof(result.get('name'));
           city = String.valueOf(results.get('name')); 
             Map<string,object> mainresults=( Map<string,object>)(results.get('main'));
            temp = string.valueOf(mainresults.get('temp'));
             pressure = string.valueOf(mainresults.get(' pressure'));
             humidity = string.valueOf(mainresults.get('humidity'));
             temp_min = string.valueOf(mainresults.get('temp_min'));
             temp_max = string.valueOf(mainresults.get('temp_max'));
            
        }
        else {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Tere was an error');
            ApexPages.addMessage(myMsg);
            
        }
    }
}