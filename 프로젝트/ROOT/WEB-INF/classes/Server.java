import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Random;

public class Server extends HttpServlet {
 
	Customer[][] cus = new Customer[8][8]; // 사용자의 정보를 담을 객체 생성
	int rev[][] = new int[8][8]; // 예약된 좌석인지 구별하기 위한 배열 
	private int[] color; // 예약 여부에 따라 색을 바꾸기 위한 배열
	private int notBooked=0;
	private int booked=1;
  
	public Server()
	{
	super();
	
	color = new int[88]; // color 배열 생성 후
	for(int i = 0; i < 88; i++) // -1로 초기화
	{
		color[i]=-1;
	}
	
	for(int i=0;i<8;i++)
		for(int j=0;j<8;j++)
		{
			cus[i][j] = new Customer(); // Customer 객체 생성
			rev[i][j]= notBooked; // 미예약 좌석임을 뜻할 0 으로 초기화
		}
	}
	
	/* Main.jsp에서 넘어온 좌석 번호를 처리하여   */
	/* 예약된 좌석인지 확인                   */
	/* 보안코드를 생성                      */
	/* Booking.jsp 로 해당 정보를 보내줄 메소드 */ 
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String first = request.getParameter("first"); // 좌석 행 정보
		String second = request.getParameter("second"); // 좌석 열 정보
		String seatNo = first+second; // 좌석 행,열 정보 합침
		char character = first.charAt(0);
		int iFirst = ((int) character) - 65; // 좌석 행 정보를 int형으로 변환하여 저장
		int iSecond = Integer.parseInt(second) -1; // 좌석 열 정보를 int형으로 변환하여 저장
		
		
		if(rev[iFirst][iSecond]==booked) // rev가 예약좌석임을 뜻하는 1이라면
		{
			out.println("This seat is already reserved"); // 메시지 출력
			out.println("<br></br>seat : " + seatNo); // 해당 좌석을
			out.println("<br></br>name : " + cus[iFirst][iSecond].getName()); // 누가 예약하였는지
			out.println("<br></br>time : " + cus[iFirst][iSecond].getTime()); // 언제 예약하였는지 출력
			out.println("<br></br><a href='/Main.jsp'> Move to main page </a>"); // 좌석 선택으로 이동하는 링크 출력
		}
		else // rev가 1이 아니라면 
		{
		/* 알파벳과 숫자로 이루어진 무작위 6자리 보안코드 생성 */ 
		String password ="";
		Random rand = new Random();
		String charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		for(int i=0; i<6;i++)
			password += charSet.charAt(rand.nextInt(62));
		
		RequestDispatcher rd=request.getRequestDispatcher("/Booking.jsp");
		request.setAttribute("security_code",password); // 보안 코드 set
		request.setAttribute("seatNo",seatNo); // 좌석 번호 set
		rd.forward(request,response); // Booking.jsp로 포워딩
		
		}
	}
	
	/* Booking.jsp에서 넘어온 사용자 입력 정보를 처리하여     */
	/* 동일한 사람이 3자리를 초과하여 예약했는지 검사           */
	/* 아닐 경우 입력 정보를 Customer 객체에 저장          */
	/* 예약 여부에 따라 좌석 색을 바꾸기 위한 color 배열 설정하여 */
	/* Main.jsp로 넘겨주는 메소드                      */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
			
		/* Booking 페이지에서 받아온 정보 저장 */
		String name = request.getParameter("cusName"); // 이름
		String phone_number = request.getParameter("cusNumber"); // 전화번호
		String email = request.getParameter("cusEmail"); // 이메일
		String address = request.getParameter("cusAddress"); // 주소
		String time = request.getParameter("time"); // 접속 시간
		int first = Integer.parseInt(request.getParameter("first"));
		int second = Integer.parseInt(request.getParameter("second"));
		int count=0; // 세 자리 초과 예약인지 확인하기 위한 변수
	   
		for(int i=0;i<8;i++)
		{
			for(int j=0;j<8;j++)
			{
				/* 사용자가 입력한 이름, 이메일이 cus 객체 배열의 이름, 이메일과 동일하다면 */
				if((name.equals(cus[i][j].getName())) && (email.equals(cus[i][j].getEmail())))
					count++;
			}
		}
	   
		/* count 가 3보다 크거나 같다면, 즉, 이미 세 자리를 예약했다면 */
	    if(count >= 3)
		{
			out.println("Only 3 seats can be reserved"); // 메시지 출력
			out.println("<br></br>name : " + name); // 해당 이름 출력
			out.println("<br></br>email : " + email); // 해당 이메일 출력
			out.println("<br></br><a href='javascript:history.go(-1)'> previous page </a>"); // 이전 페이지, 즉, 예약 페이지로 이동할 링크 출력
		}
		else /* 예약한 좌석이 세 자리보다 작다면 */
		{
		   // 사용자가 입력한 정보를 좌석번호를 인덱스로 하는 cus 배열에 저장
			cus[first][second].setName(name);
			cus[first][second].setNumber(phone_number);
			cus[first][second].setEmail(email);
			cus[first][second].setAddress(address);
			cus[first][second].setTime(time);
			rev[first][second]=booked;
		
			HttpSession session = request.getSession();
	
			for(int i=0; i<color.length; i++)
			{
				if(color[i]==-1) // color[i] 의 값이 초기화 값인 -1이라면
				{
					color[i]=first*10+second; // color[i]의 값을 좌석 행+열 인덱스로 저장
					break;
				}
			}

			session.setAttribute("color", color); // color 배열 set
			response.sendRedirect("/Main.jsp"); // Main.jsp로 Redirect
		}
	}
}