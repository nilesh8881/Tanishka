public class campaignTriggerHandler {
    public static void updateCompaignrealetedOrder(List<Campaign> lstNewCamp){
        set<Id> orderId = new set<Id>(); 
        for(Campaign camp: lstNewCamp){            // itreat inserted or updated campigen records
            if(string.isNotBlank(camp.Order__c))      //order__c is lookup field on campigen 
                orderId.add(camp.Order__c);             // store campigen related order ids
        }
        List<Order> lstorder = [SELECT Id, testCampaginOrderStatus__c, (SELECT Id, testCampaginStatus__c FROM Campaigns__r) FROM Order WHERE Id IN :orderId]; //soql query to get order and order related child campaign records.
        List<Order> lstUpdateOrder = new List<order>(); // declair order list
        
        for(Order od: lstorder){                           // iterate order records
            Integer livests = 0;                            // create variable to count campaign status = live 
            Integer pendingsts = 0; 						// create variable to count campaign status = pending
            Integer deliveredsts = 0;						// create variable to count campaign status = Delivere
            if(od.Campaigns__r.size()>0){                                //relationship name-'Campaigns__r.size', order status grater than zero.
                for(Campaign cp: od.Campaigns__r)  {                        //no of times for loop should run 
                    if(cp.testCampaginStatus__c=='Pending'){                 // API name of the campagin status field "testCampaginStatus__c", 
                        pendingsts = pendingsts+1;
                    }
                    if(cp.testCampaginStatus__c=='Live'){
                        livests = livests+1;
                    }
                    if(cp.testCampaginStatus__c=='Delivered'){
                        deliveredsts = deliveredsts+1;
                    }
                }
                if(od.Campaigns__r.size() == pendingsts){                      //all camp ststus = pending, Order sts = ready to go live
                    if(od.testCampaginOrderStatus__c != 'Ready To Go Live'){   // API name of the Order status "fieldtestCampaginOrderStatus__c"
                        od.testCampaginOrderStatus__c = 'Ready To Go Live';
                        lstUpdateOrder.add(od);
                    }
                }else if(od.Campaigns__r.size() == deliveredsts){     // all camp ststus = Delivered, Order sts = Delivered
                    if(od.testCampaginOrderStatus__c != 'Delivered'){
                        od.testCampaginOrderStatus__c = 'Delivered';
                        lstUpdateOrder.add(od);
                    }
                }else if(od.Campaigns__r.size() == livests){        // all camp ststus = Live,  Order sts = Live
                    if(od.testCampaginOrderStatus__c != 'live'){
                        od.testCampaginOrderStatus__c = 'live';
                        lstUpdateOrder.add(od);
                    }
                }else if((od.Campaigns__r.size() > pendingsts && pendingsts != 0) || ((od.Campaigns__r.size() > livests && livests != 0))){
                    if(od.testCampaginOrderStatus__c != 'Partial Live'){   //camp ststus = Pending and Live (atleast one), Order sts = Partial Live
                        od.testCampaginOrderStatus__c = 'Partial Live';
                        lstUpdateOrder.add(od);
                    }
                }
            }
        }
        if(lstUpdateOrder.size() > 0){
            update lstUpdateOrder;
        }
    } 
}