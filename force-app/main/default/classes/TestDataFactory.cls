@isTest
public class TestDataFactory {
    public static Account createAcoount(){
        Account acc = new Account();
        acc.Name= 'Test Account';
        
        return acc;
    }
    public static Contact createContact(){
        Contact con = new Contact();
        con.LastName = 'Test Contact';
        return con;
    }
    public static Opportunity createOpp(){
        Opportunity opp = new Opportunity();
        opp.Name = 'test Opp';
        opp.CloseDate = date.today();
        opp.StageName = 'prospecting';
        opp.CurrencyIsoCode = 'USD';
         return opp;
    }
    public static Lead createLead(){
        Lead led = new Lead();
        led.FirstName = 'Cole';
        led.LastName = 'Swain';
        led.Company = 'Test Comp';
        led.State = 'Closed-Convertaed';
        led.CurrencyIsoCode ='USD';
         return led;
    }
}