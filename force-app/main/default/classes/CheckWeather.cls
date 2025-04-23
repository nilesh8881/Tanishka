public with sharing class CheckWeather {
     
    @InvocableMethod
    public static List<WeatherResponse> getWeather(List<WeatherRequest> requests) {
        List<WeatherResponse> responses = new List<WeatherResponse>();

        if (requests == null || requests.isEmpty()) {
            System.debug('No request data provided.');
            return responses;
        }

        WeatherRequest requestData = requests[0];
        String location = requestData.location;
        
        if (String.isEmpty(location)) {
            System.debug('Location is empty.');
            return responses;
        }

        try {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://api.weatherapi.com/v1/current.json?key=a03fff771f7546cd953113819251802&q=' + EncodingUtil.urlEncode(location, 'UTF-8'));
            req.setMethod('GET');
            req.setHeader('Content-Type', 'application/json');

            Http http = new Http();
            HttpResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                // Parse JSON response
                Map<String, Object> parsedResponse = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

                if (parsedResponse.containsKey('current')) {
                    Map<String, Object> currentWeather = (Map<String, Object>) parsedResponse.get('current');
                    
                    WeatherResponse weatherRes = new WeatherResponse();
                    weatherRes.temperature = String.valueOf(currentWeather.get('temp_c')) + '°C';

                    if (currentWeather.containsKey('condition')) {
                        Map<String, Object> conditionData = (Map<String, Object>) currentWeather.get('condition');
                        weatherRes.condition = conditionData.containsKey('text') ? String.valueOf(conditionData.get('text')) : 'Unknown';
                    } else {
                        weatherRes.condition = 'Unknown';
                    }

                    responses.add(weatherRes);
                } else {
                    System.debug('No "current" weather data found in response.');
                }
            } else {
                System.debug('Failed to fetch weather: ' + res.getStatusCode() + ' - ' + res.getBody());
            }
        } catch (Exception e) {
            System.debug('Error in Weather API Call: ' + e.getMessage());
        }

        return responses;
    }

    public class WeatherRequest {
        @InvocableVariable
        public String location;
    }

    public class WeatherResponse {
        @InvocableVariable
        public String temperature;

        @InvocableVariable
        public String condition;
    }
}