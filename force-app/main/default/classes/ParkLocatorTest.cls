@isTest
private class ParkLocatorTest  {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> result = new List<String>();
        List<String> expectedvalue = new List<String>{'India','Japan','Germany'};
        
        result = ParkLocator.country('India');
        // Verify that a fake result is returned
        System.assertEquals(expectedvalue, result); 
    }
}