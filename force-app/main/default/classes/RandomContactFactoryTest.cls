@isTest
public class RandomContactFactoryTest {
    static testmethod void testfunction(){
        List<Contact> Con=RandomContactFactory.generateRandomContacts(2, 'Nilesh');
        System.debug(Con);
    }
}