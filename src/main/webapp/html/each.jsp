<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "kkb", "1234");
	
	try {
		String sql = "select decode(substr(a.course, 1), 'AD', '전문학사', 'BD', '학사', 'MD', '석사', 'DD', '박사') 학위과정," ;
				   sql += "a.stid, a.stname, count(a.stid)||'과목', sum(c.mid+c.final), round(nvl(sum(c.mid+c.final)/2/count(a.stid), 0), 1) ";
				   sql += "from table_std_01 a, table_subject_02 b, table_result_03 c ";
				   sql += "where a.stid = c.stid and b.subjectcode = c.dtcode ";
				   sql += "group by decode(substr(a.course, 1), 'AD', '전문학사', 'BD', '학사', 'MD', '석사', 'DD', '박사'), a.stid, a.stname ";
				   sql += "order by a.stname asc";
				   
				   PreparedStatement ps = con.prepareStatement(sql);
				   ResultSet rs = ps.executeQuery();
				   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<table>
		<caption>개인별 성적통계</caption>
		<tr>
			<th>학위과정</th>
			<th>학번</th>
			<th>성명</th>
			<th>수강교과목수</th>
			<th>총점</th>
			<th>평균</th>
		</tr>
		<%
		while(rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getInt(5) %></td>
			<td><%=rs.getFloat(6) %></td>
		</tr>
		<%
		}
		con.close();
		ps.close();
		rs.close();
		} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	</table>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>