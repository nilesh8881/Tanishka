@isTest
public class MyIterableTest {
    
    @IsTest
    static void testIterableForLoop() {
        // Create a list of strings
        List<String> strings = new List<String>{'Hello', 'World'};
        
        // Create an instance of MyIterable
        MyIterable myIterableInstance = new MyIterable(strings);
        
        // Debug statement to indicate test start
        System.debug('Running the for loop...');
        
        // Iterate over MyIterable instance
        for (String str : myIterableInstance) {
            System.debug(str);
        }
    }
}