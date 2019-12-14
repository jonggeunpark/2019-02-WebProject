import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Random;

public class HelloWorld extends HttpServlet {
 
	//[8][8] 의 Customer 객체 생성
	Customer[][] cus = new Customer[8][8];
	
  private int[] color;
  int rev[][] = new int[8][8];
  private int booked=1;
  private int notBooked=0;
  
  public HelloWorld()
  {
     super();
     color= new int[88];
    for(int i=0; i<88; i++)
    {
      color[i]=-1;
    } 
	
	for(int i=0;i<8;i++)
		for(int j=0;j<8;j++)
		{
			cus[i][j] = new Customer();
			rev[i][j]=notBooked;
		}
  }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) // 좌석 선택을 통해 받아온 좌석 번호처리
	throws ServletException, IOException {
		
		response.setContentType("text/html");
		String first = request.getParameter("first"); // 좌석 행 정보
		String second = request.getParameter("second"); // 좌석 열 정보
		String seatNo=first+second;
		
		char character = first.charAt(0);
		int iFirst = ((int) character) - 65;
		int iSecond = Integer.parseInt(second) -1;
		
		PrintWriter out = response.getWriter();
		
		if(rev[iFirst][iSecond]==booked) // 예약된 좌석이라면
		{
			out.println("alerad booked");
			out.println("<br></br>name : " + cus[iFirst][iSecond].getName());
			out.println("<br></br>time : " + cus[iFirst][iSecond].getTime());
			out.println("<br></br><a href='/test.jsp'> main page </a>");
		}
		else // 예약되지않은 좌석이라면 
		{
		// 알파벳과 숫자로 이루어진 무작위 6자리 보안코드 생성 
		String password ="";
		Random rand = new Random();
		String charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		for(int i=0; i<6;i++)
		{
			password += charSet.charAt(rand.nextInt(62));
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("/bookingPage.jsp");
	
		request.setAttribute("security_code",password); // 보안 코드 전달
		request.setAttribute("seatNo",seatNo); // 좌석 번호 전달
		rd.forward(request,response);
		
		}
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
	   int first = Integer.parseInt(request.getParameter("first"));
	   int second = Integer.parseInt(request.getParameter("second"));
	   int count=0;
	   
	   for(int i=0;i<8;i++)
	   {
		   for(int j=0;j<8;j++)
		   {
			   if((name.equals(cus[i][j].getName())) && (email.equals(cus[i][j].getEmail())))
				   count++;
		   }
	   }
	   
	    if(count >= 3)
		{
			out.println("Only 3 seats can be reserved");
			out.println("<br></br>name : " + name);
			out.println("<br></br>email : " + email);
			out.println("<br></br><a href='javascript:history.go(-1)'> previous page </a>");
		}
		else
		{
		   // 받아온 정보를 좌석번호를 인덱스로 하는 고객 배열에 저장
			cus[first][second].setName(name);
			cus[first][second].setNumber(phone_number);
			cus[first][second].setEmail(email);
			cus[first][second].setAddress(address);
			cus[first][second].setTime(time);
			rev[first][second]=booked;
		
			HttpSession session = request.getSession();
	
			for(int i=0; i<color.length; i++)
			{
				if(color[i]==-1)
				{
					color[i]=first*10+second;
					break;
				}
			}

			session.setAttribute("color", color);
			response.sendRedirect("/test.jsp");
		}
		
	}
}