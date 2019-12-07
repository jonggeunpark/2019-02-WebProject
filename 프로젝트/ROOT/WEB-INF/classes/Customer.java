public class Customer
{
	String name;
	String phone;
	String email;
	String address;
	String time;
	
	public void setName(String n){
		name=n;
	}
	public void setNumber(String n){
		phone = n;
	}
	public void setEmail(String n){
		email = n;
	}
	public void setAddress(String n){
		address = n;
	}
	public void setTime(String n){
		time = n;
	}
  
	public String getName(){
		return name;
	}
	public String getNumber(){
		return phone;
	}
	public String getEmail(){
		return email;
	}
	public String getAddress(){
		return address;
	}
	public String getTime(){
		return time;
	}
  
}