<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%> <!--import Date to represent time -->
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Booking System Main Page</title>
<style type="text/css">
#Table{ /* 테이블 속성 */
	border-spacing: 6px;
	border: 1px solid black;
	width: 400px;
	height: 400px;
	text-align: center;
}
.notBooked{ /* 미예약 좌석 속성 */
background-color:#58ACFA;
color : white;
}
.Booked{ /* 예약 좌석 속성 */
background-color:#D8D8D8;
color : white;
}
</style>

<script type="text/javascript">

function showTable(){
	var tb = document.getElementById("Table");
	
	 /* 모든 좌석의 스타일을 notBooked로 설정 - 배경 파란색, 글씨 흰색 */
  <%for(int i=1; i<9;i++)
		for(int j=1;j<9;j++){%>
			tb.rows[<%=i%>].cells[<%=j%>].className='notBooked';		
  <%}
	
    int[] color; // Server에서 설정한 color 를 저장할 배열
    int row_index=-1;
    int col_index=-1; 
   
    if(session.getAttribute("color")!=null) // color가 설정되어있다면
    {
		color=(int[])(session.getAttribute("color")); // color를 int형 배열로 캐스팅하여 저장
		
		for(int i=0; i<color.length; i++) // color 배열의 크기만큼 반복하며
        {
            if(color[i]!=-1) // color[i]의 값이 -1이 아닐 때 
            {
				row_index=color[i]/10+1; // i값의 앞자리를 row_index 
				col_index=color[i]%10+1; // i값의 뒷자리를 col_index로 분해하여 저장
				%>
				  
				/* 해당 좌석의 스타일을 Booked로 설정 - 배경 회색, 글씨 흰색 */
				tb.rows[<%=row_index%>].cells[<%=col_index%>].className='Booked'; 
          <%}
		}
	}%>
}
	
function forward(elem){
      var first = String.fromCharCode((elem-elem%10)/10 + 64); // 클릭한 좌석의 행 정보 A~H
	  var second = elem%10; // 클릭한 좌석의 열 정보 1~8
      location.href='/Server?first='+first+'&second='+second; // first,second 값을 넘겨주며 Server 로 이동
    }
	
	
</script>
</head>

<body onload="showTable();"> <!-- 좌석 표 -->
	<center>
	<h1> Seat Table </h1>
	
	<% /* 현재 시간 표시 */
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
	Date date = new Date();
	String currentTime = simpleDate.format(date);
	
	String row[]={"","A","B","C","D","E","F","G","H"};
	String col[]={"","1","2","3","4","5","6","7","8"};
	
	out.println(currentTime); 
	%>
	
	<br></br><hr></hr><p></p>
	
	<table id="Table">
	<tr><!-- A~H 생성 -->
		<%for(int i=0;i<9;i++){%>
			<td> <%=col[i]%>  </td> <%}%>
		
		<!-- 1~8 생성 -->
		<%for(int j=1;j<9;j++){%> 
			<tr> 
			<td> <%=row[j]%> </td>
			
			<!-- 클릭 시 fowrard 호출하는 A1~H8 생성-->
			<%for(int k=1;k<9;k++){%> 
				<td onclick="forward(<%=j*10+k%>)"><%=row[j]+col[k]%></td> 
			<%}%>
	<%}%>
	</tr>
	</tr>
	</center>
</body>
</html>