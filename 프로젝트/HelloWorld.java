import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Random;

public class HelloWorld extends HttpServlet {
 
	//[8][8] 의 Customer 객체 생성
	Customer[][] cus = new Customer[8][8];
	
  private int[] color;
  private String[] arr_name;
  private String[] arr_time; 
  public HelloWorld()
  {
     super();
     color= new int[88];
	 arr_name = new String[88];
	 arr_time = new String[88];
  
    for(int i=0; i<88; i++)
    {
      color[i]=-1;
	  arr_name[i] =null;
	  arr_time[i]=null;
    } 
	
		for(int i=0;i<8;i++)
			for(int j=0;j<8;j++)
				cus[i][j] = new Customer();
  }
	
	int count=0;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) // 좌석 선택을 통해 받아온 좌석 번호처리
	throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		
		String first = request.getParameter("first"); // 좌석 행 정보
		String second = request.getParameter("second"); // 좌석 열 정보
		
		// 알파벳과 숫자로 이루어진 무작위 6자리 보안코드 생성 
		String password ="";
		Random rand = new Random();
		String charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		for(int i=0; i<6;i++){
			password += charSet.charAt(rand.nextInt(62));
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("/bookingPage.jsp");
		String seatNo=first+second;
	
		request.setAttribute("security_code",password); // 보안 코드 전달
		request.setAttribute("seatNo",seatNo); // 좌석 번호 전달
		rd.forward(request,response);
	}
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
			
	   // bookingPage 에서 받아온 정보 저장
       String name = request.getParameter("cusName");
       String phone_number = request.getParameter("cusNumber");
       String email = request.getParameter("cusEmail");
       String address = request.getParameter("cusAddress");
       String time = request.getParameter("time");
	   int first_index = Integer.parseInt(request.getParameter("first"));
	   int second_index = Integer.parseInt(request.getParameter("second"));
	   	
	   // 받아온 정보를 좌석번호를 인덱스로 하는 고객 배열에 저장
	   cus[first_index][second_index].setName(name);
	   cus[first_index][second_index].setNumber(phone_number);
	   cus[first_index][second_index].setEmail(email);
	   cus[first_index][second_index].setAddress(address);
	   cus[first_index][second_index].setTime(time);
	   
 
	HttpSession session = request.getSession();
  	for(int i=0; i<color.length; i++)
 	{
		if(color[i]==-1)
		{
			color[i]=first_index*10+second_index;
			break;
		}
	}
	
	for(int i=0;i<arr_name.length;i++)
	{
		if(i/10<8 && i%10<8)
		{
		arr_name[i]=cus[i/10][i%10].getName();
		arr_time[i]=cus[i/10][i%10].getTime();
		}
	}
    session.setAttribute("color", color);
    session.setAttribute("name", arr_name);
    session.setAttribute("date", arr_time);
	response.sendRedirect("/test.jsp");
 
	
  }
  
}