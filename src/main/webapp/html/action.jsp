<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%

String stid = request.getParameter("stid");
String subcode = request.getParameter("subcode");
int mid = Integer.parseInt(request.getParameter("mid"));
int fin = Integer.parseInt(request.getParameter("fin"));
int attend = Integer.parseInt(request.getParameter("attend"));
int report = Integer.parseInt(request.getParameter("report"));
int etc = Integer.parseInt(request.getParameter("etc"));

String success = "등록되었습니다.";
String fail = "등록에 실패했습니다.";

String input = request.getParameter("input");

int result = 0;

	
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "kkb", "1234");

PreparedStatement ps = null;

try {
	if (input.equals("add")) {
		String sql = "insert into table_result_03 values (?, ?, ?, ?, ?, ?, ?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, stid);
		ps.setString(2, subcode);
		ps.setInt(3, mid);
		ps.setInt(4, fin);
		ps.setInt(5, attend);
		ps.setInt(6, report);
		ps.setInt(7, etc);
}

	result = ps.executeUpdate();
	
	con.close();
	ps.close();

} catch (Exception e) {
	e.printStackTrace();
}
if (result == 1) {
	%>
<script>
	alert("<%=success%>");
	location = "main.jsp";
	</script>
<%
} else {
	%>
<script>
	alert("<%=fail%>");
	location = "main.jsp";
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
</body>
</html>