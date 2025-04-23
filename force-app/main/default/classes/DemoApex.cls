public class DemoApex {
    Static integer z;
    public DemoApex(){
        //constructor
    }
    public static Integer method1(Integer x, Integer y){
        
        z = x + y;
        z= x - y;
        z = x /y;
        z = x * y;
        
        if(z==20){
            return z;
        }else{
            return null;
        } 
    }
    
    public static string method2(string x, string y){
        string z = x+y;
       return z;
    } 
    public static integer method3(string x){
        Integer z = x.length();
      return z;
    }
    public static Integer method4(Integer x, Integer y){
        Integer z=0;
        z = x*y;
        if(z<100){
            return z;
        }else{
            return null;
        }
    }
}