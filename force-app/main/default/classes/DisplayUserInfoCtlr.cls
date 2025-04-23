public class DisplayUserInfoCtlr{
    public Boolean isAuthorised{get;set;}
    public DisplayUserInfoCtlr(ApexPages.StandardController c){
        isAuthorised = false;
         List<PermissionSetAssignment> lstcurrentUserPerSet = ([SELECT Id
            FROM PermissionSetAssignment 
                WHERE AssigneeId = :Userinfo.getUserId() AND PermissionSet.Name = 'Trailhead']);
           if(lstcurrentUserPerSet.size()>0)
           {
            isAuthorised=true;
           }    
    }
}