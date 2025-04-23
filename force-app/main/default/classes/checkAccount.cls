@RestResource(urlMapping='/AccountsDetails/*')
global class checkAccount
{
@HttpGet
global static list<Account> getAccount()
{
LIST<Account>lst;
try
{
lst=[select name,phone from Account];
return lst;
}
catch(Exception ex)
{
system.debug('Error'+ex.getMessage());
}
return lst;
}

}