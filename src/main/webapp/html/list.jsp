<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "kkb", "1234");
request.setCharacterEncoding("UTF-8");

try {

	String sql = "select a.stid, a.stname, decode(substr(a.resident, 8, 1), '1', '남자', '2', '여자', '3', '남자', '4', '여자'), ";
	sql += "b.subject, decode(a.dtcode, '01', '전공필수', '02', '전공선택', '03', '교양필수', '04', '교양선택'), ";
	sql += "b.professor, c.mid, c.final, c.attend, c.report, c.etc, ";
	sql += "NVL((c.mid*0.3) + (c.final*0.3) + (c.attend*0.2) + (c.report*0.1) + (c.etc*0.1), '0'), ";
	sql += "case when NVL((c.mid*0.3) + (c.final*0.3) + (c.attend*0.2) + (c.report*0.1) + (c.etc*0.1), '0') >= 90 then 'A' ";
	sql += "when NVL((c.mid*0.3) + (c.final*0.3) + (c.attend*0.2) + (c.report*0.1) + (c.etc*0.1), '0') >= 80 then 'B' ";
	sql += "when NVL((c.mid*0.3) + (c.final*0.3) + (c.attend*0.2) + (c.report*0.1) + (c.etc*0.1), '0') >= 70 then 'C' ";
	sql += "when NVL((c.mid*0.3) + (c.final*0.3) + (c.attend*0.2) + (c.report*0.1) + (c.etc*0.1), '0') >= 60 then 'D' ";
	sql += "when NVL((c.mid*0.3) + (c.final*0.3) + (c.attend*0.2) + (c.report*0.1) + (c.etc*0.1), '0') > 60 then 'F' ";
	sql += "end 등급 ";
	sql += "from table_std_01 a, table_subject_02 b, table_result_03 c where a.stid = c.stid and b.subjectcode = c.dtcode";

	Statement ps = con.createStatement();
	ResultSet rs = ps.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/script.js"></script>
<link rel="stylesheet" href="css/style.css">
<style>
* {
	margin: 0 auto;
	padding: 0;
}

.list_table {
	border: 1px solid black;
	border-collapse: collapse;
}

.tr_one, .tr_two {
	border: 1px solid black;
}

.list_tr {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	border: 1px solid black;
	justify-content: center;
	text-align: center;
}

caption {
	margin: 15px 0;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<section>
		<table class="list_table">
			<caption>전체성적조회</caption>
			<tr class="list_tr tr_one">
				<th>학번</th>
				<th>성명</th>
				<th>성별</th>
				<th>과목명</th>
				<th>전공구분</th>
				<th>담당교수</th>
				<th>중간</th>
				<th>기말</th>
				<th>출석</th>
				<th>레포트</th>
				<th>기타</th>
				<th>점수</th>
				<th>등급</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr class="list_tr tr_two">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getInt(7)%></td>
				<td><%=rs.getInt(8)%></td>
				<td><%=rs.getInt(9)%></td>
				<td><%=rs.getInt(10)%></td>
				<td><%=rs.getInt(11)%></td>
				<td><%=rs.getFloat(12)%></td>
				<td><%=rs.getString(13)%></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		con.close();
		ps.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>