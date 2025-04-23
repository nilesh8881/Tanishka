public class DSHelper {
    public static void send() {
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://demo.docusign.net/restapi/v2.1/accounts/fa04a153-fc84-47ac-afab-18f53243e7da/envelopes');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization', 'Bearer eyJ0eXAiOiJNVCIsImFsZyI6IlJTMjU2Iiwia2lkIjoiNjgxODVmZjEtNGU1MS00Y2U5LWFmMWMtNjg5ODEyMjAzMzE3In0.AQsAAAABAAUABwAA3Ujb11bbSAgAAB1s6RpX20gCAOXIzKvvl2NBiOnoP9ASk9oVAAEAAAAYAAEAAAAFAAAADQAkAAAAOTFjZTExMmMtODM1Yy00NDhlLThmMmItMGVhMjgxNjQ2NDVmIgAkAAAAOTFjZTExMmMtODM1Yy00NDhlLThmMmItMGVhMjgxNjQ2NDVmEgABAAAACwAAAGludGVyYWN0aXZlMACA7wnE11bbSDcAddQaosimw0yHIIm1HuYQ9g.wss5DcBBES1sbsDNPzz2m7H9PmrA52Att2YMfazHK7mh9akJRzfxu6LnaYSxbJeoZetzz6zDIGfM3nFAC3hJonOqhY8VZ0fVz9ujt6NT_v2QfAKavI6aunW_DbROVdEQa_GjxWwHh-nLqNPv_y8E3Gd9RJ0H13LVfFAC0nJ__p9fuGLDZsuoT3641R4UfUjO4ptmEG85GWPKL7xm5G8qVtYau2wTFH5FrF6JK5W3PEHBbEFJFkjcC1dvsIcJct5YMsOwIllIgE_XEelIVSNrqE6vZig5O5sXD0ms7JwYJGSd7FiH-lvdDNCxRY62Ln3Ge7p7Iq9PoCtVuJ5qQZi55Q');
        req.setBody('{  "documentBase64": "VGVzdA==",  "emailSubject": "Test using Postman 1023",  "recipients": {    "inPersonSigners": [      {        "email": "rohitdiscovers@gmail.com",        "name": "rohit gmail",        "recipientId": "1001"      }    ]  }}');
        Http http = new Http();
        HttpResponse resp=http.send(req);
       	system.debug(resp);
        
    }
}