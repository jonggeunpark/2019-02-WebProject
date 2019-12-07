<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.Date"%> <!--import Date to represent time -->
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>Booking System Main Page</title>

<html>
<head>
<style type="text/css">
.cantBooked{
background-color:gray;
}
.afterBooked{
background-color:red;
}
</style>

<script type="text/javascript">

function showTable(){
	var tb = document.getElementById("bsTable");
	
	<% for(int i=0; i<9;i++) {%>
		tb.rows[0].className='cantBooked';
		tb.rows[<%=i%>].cells[0].className='cantBooked';		
	<%}%>
	
   <%
     int[] sIndex;
     int rowIndex=-1;
     int colIndex=-1; 
   
     if(session.getAttribute("color")!=null)
     {
		sIndex=(int[])(session.getAttribute("color"));
             for(int i=0; i<sIndex.length; i++)
             {
                if(sIndex[i]!=-1)
                {
                  rowIndex=sIndex[i]/10+1;
                  colIndex=sIndex[i]%10+1;
                }%>
				tb.rows[<%=rowIndex%>].cells[<%=colIndex%>].className='afterBooked';
			<%}
	}%>
}
	
function forward(elem1){
      var first = String.fromCharCode((elem1-elem1%10)/10 + 64); // 좌석 행 정보 A~H
	  var second = elem1%10; // 좌석 열 정보 1~8
      location.href='/HelloWorld?first='+first+'&second='+second;
    }
</script>
</head>

<body onload="showTable();"> <!-- 좌석 표 -->
	<center>
	<h1> Seat Table </h1>
	<%
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
	Date date = new Date();
	String currentTime = simpleDate.format(date);
	
	String row[]={"","A","B","C","D","E","F","G","H"};
	String col[]={"","1","2","3","4","5","6","7","8"};
	
	out.println(currentTime); 
	%>
	
	<hr></hr>
	<table id="bsTable" border="0" width="400" height="400" ;>
	<tr>
	<%for(int i=0;i<9;i++){%> <!-- 클릭 안되는 행에 대한 ..? "" ~ H -->
	<td> <%=col[i]%>  </td> <%}%>
	
	<%for(int j=1;j<9;j++){%> 
	<tr>
	<td> <%=row[j]%> </td> <!-- 클릭 안되는 열에 대한 ..? "" ~ 8 -->
		<%for(int k=1;k<9;k++){%> 
	<td onclick="forward(<%=j*10+k%>)"><%=row[j]+col[k]%></td>
	<%}%>
	<%}%>
	</tr>
	</tr>
	</table>
	</center>
</body>
</html>




