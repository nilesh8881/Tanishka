public class InsertContact {
    public static void insertConWithparameters(String firstName, String lastName){
        List<Contact> contacts = new List<Contact>();
        // insert contact 
        Contact con = new Contact(firstName= 'john1',lastName= 'sinhhha');
        insert con;
        // upsert contact
        con.Description = 'Upsert Operation done';
        contacts.add(con);
        Contact con1 = new Contact(firstName= firstName,lastName= lastName);
        contacts.add(con1);
        
        Upsert contacts;
    }
}