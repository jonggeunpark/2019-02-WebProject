<!--  
/* employees.jsp - WEB PROGRAMMING(DONGGUK UNIVERSITY) - 
 * TA: Hyun Wook Kang
 * Date: 2019-11-27
 * Description: This is a jsp page to insert the text box
 *                  elements into the database  			
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employees Form Page</title>
<style>
<!--
h3{	font-family:arial; }
.tlb
{
	border-collapse: collapse;	
	border: 2px solid #000080;
	cell-padding: 0;
	align: center;
}
.tlb th{ background-color: #CCCCCC; }
.tc{ color: #DC143C; }
-->
</style>
</head>
<body>
<h3>Please fill in the form</h3>


<form method ="post" action="/orc">

<table class="tlb">
<tr><th>FirstName</th><td><input type="text" name="" id="empFirstName"/></td>
<tr><th>LastName</th><td><input type="text" name="" id="empLastName"/></td>
<tr><th>Phone</th><td><input type="text" name="" id="empPhone"/></td>
<tr><th>BirthDate</th><td><input type="text" name="" id="empBirthDate"/></td>
<tr><th>Sex</th><td><input type="text" name="" id="empSex"/></td>
<tr><th>Job</th><td><input type="text" name="" id="empJob"></td>
<tr><th>Salary</th><td><input type="text" name="" id="empSalary"/></td>
</table>

<div style="margin-left:70px">
<input type="submit" value="submit" />
<input type="reset" value="reset" />
</div>
</form>
</body>
</html>