<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<section>
		<form method="post" action="action.jsp" name="frm">
			<input type="hidden" name="input" value="add" />
			<table>
				<caption>개인성적등록</caption>
				<tr>
					<th>학번</th>
					<td><input type="text" name="stid" /></td>
				</tr>
				<tr>
					<th>과목코드</th>
					<td><input type="text" name="subcode" />예)S001</td>
				</tr>
				<tr>
					<th>중간 (30%) (0~100)</th>
					<td><input type="text" name="mid" /> 점</td>
				</tr>
				<tr>
					<th>기말 (30%) (0~100)</th>
					<td><input type="text" name="fin" /> 점</td>
				</tr>
				<tr>
					<th>출석 (20%) (0~100)</th>
					<td><input type="text" name="attend" /> 점</td>
				</tr>
				<tr>
					<th>레포트 (10%) (0~100)</th>
					<td><input type="text" name="report" /> 점</td>
				</tr>
				<tr>
					<th>기타 (10%) (0~100)</th>
					<td><input type="text" name="etc" /> 점</td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="submit" value="등  록" onclick="submit" />
						<button type="reset" onclick="alert(); return false;">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>