public class spoonacular {
    private static final string SPOONACULAR_API = 'https://api.spoonacular.com'; 
    private static final string API_KEY = '6dca79b71ef3491c882dd2237da218b5';
        
   	public static void getRandomReceipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+response.getBody());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            System.debug('response '+response.getBody());
        }
    }
    public static void getReceipe(String receipeId ){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/'+receipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+response.getBody());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            System.debug('response '+response.getBody());
        }
    }
    public static void getRecipeByIngredients(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        System.debug('response code '+response.getBody());
        
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            System.debug('response '+response.getBody());
        }
    }
}