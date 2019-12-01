<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%> <!--import Date to represent time -->
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
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
	
	if(!cus_email) // 이메일 미기입
	{
		msg+= "email is empty!\n";
		status_flag=false;
	}

	/*
	if(!cus_email.contains("@"))
	{
		msg+= "email must contain @\n";
		status_flag=false;
	}
	*/
	
	
	if(cus_code!=sec) // 보안코드 틀림
	{	
		msg += "please check security code!\n";
		status_flag=false;
	}
		
	if(status_flag == false)
		alert(msg);
	
	return status_flag;
}

</script>
</head>
<body>

<%
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
Date date = new Date();
String currentTime = simpleDate.format(date);
	
String seatNo = request.getAttribute("seatNo").toString();
String security_code = request.getAttribute("security_code").toString();
int firstIndex = seatNo.charAt(0)-65; // A의 아스키 코드값인 65 빼줌
int secondIndex = seatNo.charAt(1)-49; // 1의 아스키코드값인 49 빼줌
%>

Booking page
<p />
Connect Time : <% out.println(currentTime);%> <br />
Seat No : <% out.println(seatNo);%> <br />

<form method ="post" onsubmit ="return validate();" action="/HelloWorld">
name (required): <input type = "text" id = "cus_name" name="cusName" /> <br /> <!-- 이름 입력 태그 -->
email address (required, @) : <input type = "text" id = "cus_email" name="cusEmail"/> <br /><!-- 이메일 입력 태그 -->
phone number : <input type = "text" id = "cus_number" name="cusNumber"/> <br /> <!-- 전화번호 입력 태그 -->
address : <input type = "text" id = "cus_address" name="cusAddress"/> <br /> <!-- 주소지 입력 태그 -->
security code : <% out.println(security_code);%> <br />
<input type = "text" id = "cus_code" name="cusCode" /> <!-- 보안 코드 입력 태그 -->
<input type="hidden" id="sec" value="<%=security_code%>" /> <!-- 보안 코드 --> 
<input type="hidden" name ="first" value="<%=firstIndex%>" /> <!-- 좌석 행 --> 
<input type="hidden" name ="second" value="<%=secondIndex%>" /> <!-- 좌석 열 -->
<input type="hidden" name ="time" value="<%=currentTime%>" /> <!-- 접속 시간 -->
<input type="submit" value="submit"/>
<input type="reset" value="clear" />

<br />
</form>
</body>
</html>