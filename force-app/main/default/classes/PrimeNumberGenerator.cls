public class PrimeNumberGenerator {
    public void genrate(integer startNumber , integer endNumber){
        for(integer i=startNumber;i<=endNumber;i++)
        {
            integer count=0;
            for(integer j=i; j>=1;j--)
            {
                if(math.mod(i,j)==0 ) // Remainder after division (modulo operation)
                {
                    count++;
                }
            }
            if(count==2 || count==1){
                system.debug(i);            
            } 
        }
    }
}