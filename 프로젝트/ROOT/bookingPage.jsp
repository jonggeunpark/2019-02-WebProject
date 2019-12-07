<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%> <!--import Date to represent time -->
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title> Booking page </title>
<style>
</style>

<script type="text/javascript">
function validate()
{
	var status_flag=true; // return 할지말지 결정할 변수
	var msg = "";
	
	//Element 받아온 값 저장
    var cus_name=document.getElementById("cus_name").value; // 사용자가 입력한 이름
	var cus_number=document.getElementById("cus_number").value; // 사용자가 입력한 전화번호
	var cus_email=document.getElementById("cus_email").value; // 사용자가 입력한 이메일
	var cus_address=document.getElementById("cus_address").value; // 사용자가 입력한 주소지
	var cus_code=document.getElementById("cus_code").value; // 사용자가 입력한 보안코드
    var sec=document.getElementById("sec").value; // 주어진 보안코드

	if(!cus_name) // 이름 미기입
	{
		msg += "name is empty!\n";
		status_flag=false;
	}
	// 이름 숫자 체크 구현
	if(cus_name.indexOf("0") != -1 || cus_name.indexOf("1") != -1 || cus_name.indexOf("2") != -1 || cus_name.indexOf("3") != -1
	|| cus_name.indexOf("4") != -1 || cus_name.indexOf("5") != -1 || cus_name.indexOf("6") != -1 || cus_name.indexOf("7") != -1
	|| cus_name.indexOf("8") != -1 || cus_name.indexOf("9") != -1) 
	{
		msg+= "name contain number\n";
		status_flag=false;
	}
	
	if(!cus_email) // 이메일 미기입
	{
		msg+= "email is empty!\n";
		status_flag=false;
	}
	
	if(cus_email.indexOf("@") == -1)
	{
		msg+= "email must contain @\n";
		status_flag=false;
	}
	
	if(cus_code!=sec) // 보안코드 틀림
	{	
		msg += "please check security code!\n";
		status_flag=false;
	}
		
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
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
Date date = new Date();
String currentTime = simpleDate.format(date);
	
String seatNo = request.getAttribute("seatNo").toString();
String security_code = request.getAttribute("security_code").toString();
int firstIndex = seatNo.charAt(0)-65; // A의 아스키 코드값인 65 빼줌
int secondIndex = seatNo.charAt(1)-49; // 1의 아스키코드값인 49 빼줌
%>

<h1> Booking page </h1>
<%out.println(currentTime);%> <br/>
Seat No : <% out.println(seatNo);%> <br />
<hr></hr>
<table>
<form method ="post" onsubmit ="return validate();" action="/HelloWorld">
<tr><td>name (required, not 1~9)</td><td> <input type = "text" id = "cus_name" name="cusName" /></td> <!-- 이름 입력 태그 -->
<tr><td>email address (required, @)</td><td><input type = "text" id = "cus_email" name="cusEmail"/></td><!-- 이메일 입력 태그 -->
<tr><td>phone number </td><td><input type = "text" id = "cus_number" name="cusNumber"/> </td> <!-- 전화번호 입력 태그 -->
<tr><td>address </td><td><input type = "text" id = "cus_address" name="cusAddress"/> </td> <!-- 주소지 입력 태그 -->
<tr><td>security code : <%=security_code%></td> <td><input type = "text" id = "cus_code" name="cusCode" /> </td><!-- 보안 코드 입력 태그 -->
<input type="hidden" id="sec" value="<%=security_code%>" /> <!-- 보안 코드 --> 
<input type="hidden" name ="first" value="<%=firstIndex%>" /> <!-- 좌석 행 --> 
<input type="hidden" name ="second" value="<%=secondIndex%>" /> <!-- 좌석 열 -->
<input type="hidden" name ="time" value="<%=currentTime%>" /> <!-- 접속 시간 -->
</table>
<input type="submit" value="submit"/>
<input type="reset" value="clear" />
</form>
</center>
</body>
</html>