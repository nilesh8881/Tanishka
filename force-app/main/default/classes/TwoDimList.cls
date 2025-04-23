public class TwoDimList {
    public static void main(){
        List<List<Integer>> twodlist = new List<List<Integer>>();
        System.debug('Origanl list Value ' +twodlist);
        List<Integer> i1 = new List<Integer>{1,2,3};
            System.debug('After Add i1 list Value ' +i1 );
            List<Integer> i2 = new List<Integer>{4,5,6};
                System.debug('After Add i2 list Value ' +i2);
                List<Integer> i3 =new List<Integer>{7,8,9};
                    System.debug('After Add i3 list Value ' +i3);
        twodlist.add(i1);
        twodlist.add(i2);
        twodlist.add(i3);
        System.debug('Origanl list Value ' +twodlist);
        
        for(integer i=0;i<3;i++){
            System.debug('integer I');
            for(integer j=0;j<3;j++){
                System.debug('integer J');
                if(i<j){
                    integer temp = twodlist[i][j];
                    twodlist[i][j] = twodlist[j][i];
                    twodlist[i][j] = temp;
                }
            }
        }
        system.debug('After Changing Value' +twodlist);
    }
}