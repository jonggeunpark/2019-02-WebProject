<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%> <!--import Date to represent time -->
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title> Booking Page </title>
<style>
</style>

<script type="text/javascript">

/* 입력한 정보가 조건에 맞는지 확인하는 함수 */
/* 조건1 - 이름 필수, 숫자 불포함      */
/* 조건2 - 이메일 필수, @ 포함       */
/* 조건3 - 보안코드 일치            */
function validate()
{
	var status_flag=true; // 모든 정보에 오류가 없다면 true
	var msg = ""; // 경고 메시지 저장할 변수
	
	// 입력 정보들 받아와서 저장
    var cus_name=document.getElementById("cus_name").value; // 사용자가 입력한 이름
	var cus_number=document.getElementById("cus_number").value; // 사용자가 입력한 전화번호
	var cus_email=document.getElementById("cus_email").value; // 사용자가 입력한 이메일
	var cus_address=document.getElementById("cus_address").value; // 사용자가 입력한 주소지
	var cus_code=document.getElementById("cus_code").value; // 사용자가 입력한 보안코드
    var sec=document.getElementById("sec").value; // Server에서 설정한 보안코드

	if(!cus_name) // 이름을 기입하지 않았을 경우
	{
		msg += "Name is empty\n";
		status_flag=false;
	}
	
	// 이름에 숫자가 들어갈 경우
	if(cus_name.indexOf("0") != -1 || cus_name.indexOf("1") != -1 || cus_name.indexOf("2") != -1 || cus_name.indexOf("3") != -1
	|| cus_name.indexOf("4") != -1 || cus_name.indexOf("5") != -1 || cus_name.indexOf("6") != -1 || cus_name.indexOf("7") != -1
	|| cus_name.indexOf("8") != -1 || cus_name.indexOf("9") != -1) 
	{
		msg+= "Name must not contain number\n";
		status_flag=false;
	}
	
	// 이메일을 기입하지 않았을 경우
	if(!cus_email) 
	{
		msg+= "Email is empty\n";
		status_flag=false;
	}
	
	// 이메일에 @가 들어가지 않았을 경우
	if(cus_email.indexOf("@") == -1)
	{
		msg+= "Email must contain @\n";
		status_flag=false;
	}
	
	// 보안코드가 맞지않을 경우
	if(cus_code!=sec)
	{	
		msg += "Check security code\n";
		status_flag=false;
	}
	
	// 하나의 조건이라도 어긋날 경우
	if(status_flag == false)
	{
		alert(msg);
	}
	
	return status_flag;
}

</script>
</head>
<body>
<center>
<%
// 시간 출력을 위한 객체 및 변수
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
Date date = new Date();
String currentTime = simpleDate.format(date);
	
String seatNo = request.getAttribute("seatNo").toString(); // Server에서 설정한 좌석정보를 문자열로 저장
String security_code = request.getAttribute("security_code").toString(); // Server에서 설정한 보안코드를 문자열로 저장 
int firstIndex = seatNo.charAt(0)-65; // A의 아스키 코드값인 65 빼서 int형으로 저장
int secondIndex = seatNo.charAt(1)-49; // 1의 아스키코드값인 49 빼서 int형으로 저장
%>

<h1> Booking </h1>
<%out.println(currentTime);%> <br> <!-- 시간 출력 -->
Seat No : <% out.println(seatNo);%> <br> <!-- 좌석번호 출력 -->
<hr></hr>
<table> <!-- 정보 입력 테이블 -->
<form method ="post" onsubmit ="return validate();" action="/Server"> <!-- submit 클릭시 validate() 수행하고 데이터 post 방식으로 Server로 보냄 -->
<tr><td>name (required, without numbers)</td><td> <input type = "text" id = "cus_name" name="cusName" /></td> <!-- 이름 입력 태그 -->
<tr><td>email address (required, with @)</td><td><input type = "text" id = "cus_email" name="cusEmail"/></td><!-- 이메일 입력 태그 -->
<tr><td>phone number </td><td><input type = "text" id = "cus_number" name="cusNumber"/> </td> <!-- 전화번호 입력 태그 -->
<tr><td>address </td><td><input type = "text" id = "cus_address" name="cusAddress"/> </td> <!-- 주소지 입력 태그 -->
<tr><td>security code : <%=security_code%></td> <td><input type = "text" id = "cus_code" name="cusCode" /> </td><!-- 보안 코드 입력 태그 -->
<input type="hidden" id="sec" value="<%=security_code%>" /> <!-- 보안 코드 --> 
<input type="hidden" name ="first" value="<%=firstIndex%>" /> <!-- 좌석 행 --> 
<input type="hidden" name ="second" value="<%=secondIndex%>" /> <!-- 좌석 열 -->
<input type="hidden" name ="time" value="<%=currentTime%>" /> <!-- 접속 시간 -->
</table>
<input type="submit" value="submit"/> <!-- 제출 버튼 -->
<input type="reset" value="clear" /> <!-- 초기화 버튼 -->
</form>
</center>
</body>
</html>