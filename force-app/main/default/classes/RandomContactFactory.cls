public class RandomContactFactory {
    Public Static List<Contact>generateRandomContacts(integer numofContacts,string LastNameGen){
        List<contact>con= new List<Contact>();
        for(Integer i=0;i<numofContacts;i++){
            LastNameGen='Test'+ i;
            Contact c = new Contact (firstName='fn'+i,lastName=LastNameGen);
            con.add(c);
        }
        return con;
    }
}