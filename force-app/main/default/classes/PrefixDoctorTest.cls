@isTest
public class PrefixDoctorTest {
    Public static testMethod void PreDoctor(){
        Lead l=new Lead();
        l.FirstName='Dr Tanishka';
        l.LastName='Patil';
        l.company='Raider Data Science';
        l.Status='Open - Not Contacted';
		insert l;
		Lead le = [Select id,FirstName, LastName from Lead where company='Raider Data Science'];
		//System.assertEquals(le.FirstName.ContainsIgnoreCase('Dr'),'Dr');
    }
}