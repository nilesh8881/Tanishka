@isTest 
public class campaignTriggerHandlerTest {
    @TestSetup
    static void createTestData() {      //This method use to test data setup
        Account ac = new Account(name='Amanda'); //insert acount for Oder creation
        insert ac;
        
        Order od = new order(AccountId=ac.id, Status='Draft', EffectiveDate=date.today()); //Insert Order for campain creation
        insert od; 
    }
    public static testmethod void campaignStatusPendingLive(){			//This method use to cover Order related Live and Pending campaign records test coverage
        Account ac = [Select id from Account where name='Amanda'];
        Order od= [Select id from Order where Status='Draft'];
        
        List<Campaign> lstCam = new List<Campaign>();
        for(integer i=0;i<3;i++){
            Campaign camp = new Campaign();
            camp.Order__c = od.id;
            camp.Name = 'john sinha'+i;
            if(i==0){
                camp.testCampaginStatus__c = 'Pending';
            }else if(i==1){
                camp.testCampaginStatus__c = 'Live';
            }else{
                camp.testCampaginStatus__c = 'Delivered';
            }         
            lstCam.add(camp);
        } 
        insert lstCam;
    } 
    public static testmethod void campaignStatusPending(){				//This method use to cover Order related Pending campaign records test coverage
        Account ac = [Select id from Account where name='Amanda'];
        Order od= [Select id from Order where Status='Draft'];
        
        List<Campaign> lstCam = new List<Campaign>();
        for(integer i=0;i<3;i++){
            Campaign camp = new Campaign();
            camp.Order__c = od.id;
            camp.Name = 'john sinha'+i;
            camp.testCampaginStatus__c = 'Pending';
            lstCam.add(camp);
        } 
        insert lstCam;
    }
    public static testmethod void campaignStatusLive(){				//This method use to cover Order related Live campaign records test coverage
        Account ac = [Select id from Account where name='Amanda'];
        Order od= [Select id from Order where Status='Draft'];
        
        List<Campaign> lstCam = new List<Campaign>();
        for(integer i=0;i<3;i++){
            Campaign camp = new Campaign();
            camp.Order__c = od.id;
            camp.Name = 'john sinha'+i;
            camp.testCampaginStatus__c = 'Live';
            lstCam.add(camp);
        } 
        insert lstCam;
    }
    public static testmethod void campaignStatusDelivered(){			//This method use to cover Order related Delivered campaign records test coverage
        Account ac = [Select id from Account where name='Amanda'];
        Order od= [Select id from Order where Status='Draft'];
        
        List<Campaign> lstCam = new List<Campaign>();
        for(integer i=0;i<3;i++){
            Campaign camp = new Campaign();
            camp.Order__c = od.id;
            camp.Name = 'john sinha'+i;
            camp.testCampaginStatus__c = 'Delivered';
            lstCam.add(camp);
        } 
        insert lstCam;
    } 
}