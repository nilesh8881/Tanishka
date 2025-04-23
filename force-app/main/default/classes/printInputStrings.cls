public class printInputStrings {
    public static List<string> generateStringList(integer numStr, string str1, string str2){
	List<string> lstStr = new List<string>();
        
        for(integer i=0;i<numStr;i++) {
          //  string str = 'numStr str1 numStr str2'+i;
            string str = i+str1+' '+i+str2;
            lstStr.add(str);
        }
        system.debug('::>>'+lstStr);
        return lstStr;
    }
}