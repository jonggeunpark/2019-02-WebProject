public class Customer
{
	String name; // 이름
	String phone; // 전화번호
	String email; // 이메일
	String address; // 주소
	String time; // 시간
	
	public void setName(String n){ // 이름 저장
		name=n;
	}
	public void setNumber(String n){ // 전화번호 저장
		phone = n;
	}
	public void setEmail(String n){ // 이메일 저장
		email = n;
	}
	public void setAddress(String n){ // 주소 저장
		address = n; 
	}
	public void setTime(String n){ // 시간 저장
		time = n;
	}
  
	public String getName(){ // 이름 반환
		return name;
	}
	public String getNumber(){ // 전화번호 반환
		return phone;
	}
	public String getEmail(){ // 이메일 반환
		return email;
	}
	public String getAddress(){ // 주소 반환
		return address;
	}
	public String getTime(){ // 시간 반환
		return time;
	}
}