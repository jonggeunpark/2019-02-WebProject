import java.sql.*; 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

	   
public class orc extends HttpServlet {
	
		static String empFirstName;
        static String empLastName;
        static String empPhone;
        static String empBirthDate;
        static String empSex;
	    static String empJob;
	    static String empSalary;
		
public void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{

         empFirstName = request.getParameter("empFirstName");
         empLastName = request.getParameter("empLastName");
         empPhone = request.getParameter("empPhone");
         empBirthDate = request.getParameter("empBirthDate");
         empSex = request.getParameter("empSex");
	     empJob = request.getParameter("empJob");
	     empSalary = request.getParameter("empSalary");
		
	}
  

public static void main(String args[]){  
	   
try{  

Class.forName("oracle.jdbc.driver.OracleDriver");  
  
String SQL= "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?)";
Connection con=DriverManager.getConnection(  
"jdbc:oracle:thin:@localhost:1521:xe","system","1234");  
PreparedStatement pstmt  = con.prepareStatement(SQL);
pstmt.setString(1,empFirstName);
pstmt.setString(2,empLastName);
pstmt.setString(3,empPhone);
pstmt.setString(4,empBirthDate);
pstmt.setString(5,empSex);
pstmt.setString(6,empJob);
pstmt.setString(7,empSalary);

Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from emp");  
while(rs.next())  
System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
  
con.close();  
  
}catch(Exception e){ System.out.println(e);}  
  
}  
}
