public class ContactCheck {
    public static void checkInsert(list<Contact> ConAllist){
        list<contact> Conlist = New list<contact>();
        for(Contact c: conAllist){
            if(c.AccountId != Null)
            {Conlist.add(c);}
        }
        if(Conlist.size()>0)
        {checkforConLimit(Conlist);}
    }
    public static void checkUpdate(list<Contact> ConAllist, map<id,Contact> Conoldmap){
        list<contact> Conlist = New list<contact>();
        for(Contact c: conAllist){
            if(c.AccountId != Null && c.AccountId != Conoldmap.get(c.Id).AccountId)
            {Conlist.add(c);}
        }
        if(Conlist.size()>0)
        {checkforConLimit(Conlist);}
    }
    public static void checkforConLimit(list<Contact> Conlist){
        //set of ids of all contacts
        set<id> accids = New set<id>(); 
        for(Contact c: conlist) { accids.add(c.AccountId);}
        if(accids.size()>0){
            //map containing acc id from accid
            Map<id,Account> mapofacc = New Map<Id,Account>([SELECT Id,(SELECT ID from Contacts) From Account where Id IN : accids]);
            for(Contact c: conlist){
                //match trigger contact with its acc id and check size
                if(mapofacc.get(c.AccountId).Contacts.size()>=3)
                {
                    
                }
            }     
        }   
    }
    public static void phupdate(list<Contact> ConAllist, Map<Id, Account> accountMap){
        List<Account> li= new list<Account>();
        List<Id> ids = new List<Id>();
        for(contact c:ConAllist){
            ids.add(c.AccountId);
        }
        for(contact c:ConAllist){
            Account a = accountMap.get(c.AccountId);
            if(a!=null){
                a.Phone= c.MobilePhone;
				li.add(a);
            }
        }
    }
}