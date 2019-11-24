<html>
<head>
<script type="text/javascript">
function validate()
{
	var status_flag = true;
    var status_name = true;
	var status_number = true;
	var status_email = true;
	var msg = "";
	
	//Element 받아옴
    var cus_name=document.getElementById("cus_name").value;
	var cus_number=document.getElementById("cus_number").value;
	var cus_email=document.getElementById("cus_email").value;
	
	
	if(!cus_name) // 이름 미기입
	{
        status_name=false;
		status_flag=false;;
	}
	if(!cus_number) // 전화번호 미기입
	{
		status_number=false;
		status_flag=false;
	}
	if(!cus_email) // 이메일 미기입
	{
		status_email=false;
		status_flag=false;
	}
	
	// 미기입 정보에 따른 경고 메시지 출력
	if(status_name==false)
		msg += "name is empty!\n";
	if(status_number==false)
		msg += "phone number is empty!\n";
	if(status_email==false)
		msg += "email address is empty!";
	
	if(status_flag == false)
		alert(msg);
	
  return status_flag;
}
</script>
</head>

<body>
<% String seatNo = request.getAttribute("seatNo").toString(); %>

<!-- <시프트5 String first = %> -->
Booking page
<br />
Seat No: <% out.println(seatNo);%>
<br />
<form method ="post" onsubmit ="return validate();" action="/HelloWorld">
name : <input type = "text" id = "cus_name" name="cusName" /> <br /> <!-- 이름 입력 태그 -->
phone number : <input type = "text" id = "cus_number" name="cusNumber"/> <br /> <!-- 전화번호 입력 태그 -->
email address : <input type = "text" id = "cus_email" name="cusEmail"/> <!-- 이메일 입력 태그 -->

<!--
<input type="hidden" name ="first" value="<시프트5=firstIndex%>" /> <!-- 좌석 행 정보 --> 
<!--
<input type="hidden" name ="second" value="<시프트5=secondIndex%>" /> <!-- 좌석 열 정보 -->

<input type="submit" value="submit"/>
<br />
</form>
</body>
</html>



