Public class Employees{
   private String firstName;
    private String lastName;
    private Date dateOfBirth;
      List<Employees> emps= new List<Employees>();
    Public void Employ(String firstName,String lastName,Date dateOfBirt){
        this.firstName=firstName;
        this.lastName=lastName;
        this.dateOfBirth=dateOfBirt;
         emps.add(this);
        //System.debug('::>>'+emps);
        
    }
    Public void printInfo()
    {
        System.debug('First Name :'+firstName);
        System.debug('Last Name :'+lastName);
        System.debug('Date of Birth :'+dateOfBirth);
        
    }
}