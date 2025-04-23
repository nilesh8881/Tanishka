public class ApexPatternClass {
    public static void tranglePattern(Integer size){
        for(integer i=0;i<=size;i++)
        {
            string s='  ';
            for(integer j=0;j<=size;j++)
            {
                if(j<=size-i)
                {
                    s = s + 'x';
                }
                else
                {
                    s = s + '_';
                }
            }
            
            system.debug(s);
            
        }
        
    } 
}