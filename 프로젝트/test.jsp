<html>
<head>

<script type="text/javascript">
    function forward(elem1){
      var first = String.fromCharCode((elem1-elem1%10)/10 + 64); // 좌석 행 정보 A~H
	  var second = elem1%10; // 좌석 열 정보 1~8
      location.href='/HelloWorld?first='+first+'&second='+second;
    }
    </script>
</head>

<body> <!-- 좌석 표 -->
	<%!String row[]={"","A","B","C","D","E","F","G","H"};%>
	<%!String col[]={"","1","2","3","4","5","6","7","8"};%>
	<table border=1>
	<tr>
	<%for(int i=0;i<9;i++){%>
	<tr>
		<%for(int j=0;j<9;j++){%>
	<td onclick="forward(<%=i*10+j%>)"><%=row[i]+col[j]%></td>
	<%}%>
	<%}%>
	</tr>
	</tr>
	</table>
</body>
</html>