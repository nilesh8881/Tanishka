public class NewCaseListController {
 
public List<Case> getNewCases() {
    List<Case> results = Database.query(
        'SELECT Id, CaseNumber from case where status = \'New\'');
    return results; 
        
}
}