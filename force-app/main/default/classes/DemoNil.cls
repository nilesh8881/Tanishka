public class DemoNil {
    Static Integer int12 = 10;
    public DemoNil(){// Constuctor
	System.debug('Constuctor');        
    }
    public static integer addition(){ //Static methode  
        Integer int1 = 5;
        integer rt = int12 + int1; 
        System.debug('Addition ' +rt);
        return rt;
    }
    Public Integer demoAddition(){ //Non-Static methode
        integer tr = 15;
        integer tre = int12+tr+DemoNil.addition();
        System.debug('Final Addition '+tre);
        return tre;
    }
    Public static void m3(){ // 
       // Integer ty = DemoNil.demoAddition(); 
    }

}