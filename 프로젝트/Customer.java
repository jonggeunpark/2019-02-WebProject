public class Customer
{
  String name;
  String phoneNumber;
  String emailAddress;
  
  public void setName(String n)
  {
	  name=n;
  }
  public void setNumber(String n)
  {
	  phoneNumber = n;
  }
  public void setEmail(String n)
  {
	  emailAddress = n;
  }
  
  public String getName()
  {
	  return name;
  }
  public String getNumber()
  {
	  return phoneNumber;
  }
  public String getEmail()
  {
	  return emailAddress;
  }
}