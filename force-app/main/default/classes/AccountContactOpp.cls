public class AccountContactOpp {
    public AccountContactOpp(){
        
    }
    
    public static void method1(string name,integer x,string lname,integer y,string oppname,integer z){
        List<Account> lstacc = new List<Account>();
        List<Contact> lstcon = new List<Contact>();
        List<Opportunity> lstopp = new List<Opportunity>();
        List<OpportunityContactRole> listOppRole = new List<OpportunityContactRole>();
        
        for(integer i=1; i<= x; i++){
            Account acc = new Account();
            acc.name = name + i;
            lstacc.add(acc);
        }
        insert lstacc;
        System.debug('lstacc::>> ' +lstacc);
        Map<id,id> mapacntwithcon = new Map<id,id>();
        // Contact Insert 
        for(Account acc : lstacc){ 
            for(integer i=1; i<= y; i++){
                Contact con = new Contact();
                con.LastName = lname + i;
                con.AccountId = acc.id;
                lstcon.add(con);
            }
        }
        insert lstcon; 
        System.debug('lstcon::>> ' +lstcon);
        // Opportunity 
        for(Account acc :lstacc){
            for(integer i=1; i<=z; i++){
                Opportunity opp = new Opportunity();
                opp.name = oppname + i;
                opp.Closedate = Date.today();
                opp.stageName ='Pre-Qualification';
                opp.AccountId = acc.id;
                //opp.AccountId = con.Id;   
                lstopp.add(opp);
            }
        }
        insert lstopp;
        System.debug('lstopp::>> ' +lstopp);
        // contact role
        for(Contact con :lstcon){
            System.debug('con ' +con);
            for(Opportunity op:lstopp){
                System.debug('op ' +op);
                OpportunityContactRole opprole  = new OpportunityContactRole();
                opprole.ContactId = con.id;
                opprole.OpportunityId = op.id;
                opprole.Role = 'Decision Maker';
                opprole.IsPrimary = true;
                listOppRole.add(opprole);
            }
        }
        insert listOppRole;
        System.debug('listOppRole::>> ' +listOppRole);
    }
}