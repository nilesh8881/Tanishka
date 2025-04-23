public class Exercise1 {
    Static String str = 'Nilesh'; 
    
    Public Static String m1(){
        String sr1='Patil';
        String sr = str + ' '+ sr1;
        System.debug('M1' +sr);
        return sr;
    }
    Public Static String m2(){
        String tr='Raider';
        String mr = Exercise1.m1() + ' '+ tr;
        System.debug('M2' +mr);
        return mr;
    }
        Public Static void m3(){
        String mr1 = Exercise1.m2() + ' '+ str;
        System.debug('M3' +mr1);
    }
}