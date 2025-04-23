public class DemofirstApex{
    
    public static integer remainder;
    public static Boolean isPrime = true;
    // Method1 For Prime Number
    
    public static Boolean method1(Integer x){
        for(integer i=2;i<=x/2;i++)
        {
            remainder = math.mod(x,i);
            System.debug(x+ 'Divided by'+ i + 'gives a remainder'+remainder);
            //if remainder is 0 than numberToCheckber is not prime and break loop. Elese continue loop
            if(remainder == 0)
            {
                isPrime = false;
                break;
            }
        }
        return isPrime;
    }
    // Methods2 for Multiplication
    public static Boolean method2(integer x,integer y,integer z){
        Boolean b = false;
        integer mul = x*y*z;
        If(mul==500){
            b = true;
        }
        return b;
    }
    
    // Method for 3 Current Month
    public static Boolean  method3(string d){
        Boolean b = false;
        DateTime dt = DateTime.now();
        if(d == dt.format('MMMMM')){
            b = true;
        }
        return b;
    }
    //Method4 for Vowels 
    public static Boolean method4(string x,string y){
        List<String> lst = new List<String>{'a','e','i','o','u'};
        Boolean b = false;
        //string x1 ='a,e,i,o,u';
        Boolean result1 = lst.contains(x);
        Boolean result2 = lst.contains(y);
        if(result1 ){
            b = true;
        }
        return b;
    }
}