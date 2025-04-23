public class DemoInterfaceTest {
    
    public static void testmethod1(){
        EmployeeOrder empOrder = new EmployeeOrder();
        Double ans = empOrder.discount();
        System.debug('Discount of Employee ' +ans);
        
        CustomerOrder custmOrder = new CustomerOrder();
        Double result = custmOrder.discount();
        System.debug('Discount of Customer ' +result);
    }
}