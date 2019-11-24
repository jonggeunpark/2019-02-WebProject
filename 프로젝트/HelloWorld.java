import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorld extends HttpServlet {
 
   Customer[][] cus = new Customer[8][8];
  
   int count=0;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) // 좌석 선택을 통해 받아온 좌석 번호처리
	throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		
		String first = request.getParameter("first"); // 좌석 행 정보
		String second = request.getParameter("second"); // 좌석 열 정보
		
		RequestDispatcher rd=request.getRequestDispatcher("/bookingPage.jsp");
		String seatNo=first+second;
	
		request.setAttribute("seatNo",seatNo);
		rd.forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
     
       String name = request.getParameter("cusName");
       String phone_number = request.getParameter("cusNumber");
       String email = request.getParameter("cusEmail");
       out.println(name);
	   out.println(phone_number);
	   out.println(email);
	   
	   //cus[first][second].setName();
	   
	   /*
       int phoneNumber = Integer.parseInt(request.getParameter("phonenumber"));
       int firstIndex = Integer.parseInt(request.getParameter("firstIndex"));

       out.println(name+"<br />");
       out.println(phoneNumber);
       out.println("<br />"+firstIndex);
	   */
	   
	   
	
	/*
	response.setContentType("text/html");
              String name= request.getParameter("cusName");
            String phoneNumber=
			String email=
			customer[firstIndex][secondIndex].setName(name);
			customer[firstIndex][secondIndex].setPhoneNumber(phoneNumber);

        for(int i=0; i<8;	

		{
			if(name.equals(customr[i][j].getName9) && email)
				 count++;
			 <a href="gobc
		}			
 		PrintWriter out = response.getWriter();
      	out.println("<h1>" + name + "</h1>");
		*/
  }
  
}