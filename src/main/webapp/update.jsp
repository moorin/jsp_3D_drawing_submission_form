<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Update</title>
</head>
<body>
	<form method="post" action="update_process.jsp">
		<h2>수정</h2>
		<ul>
			<li>이름: <input type="text" name="name"></li>
			<li>비밀번호: <input type="password" name="password"></li>
			<li>변경할 프로젝트명: <input type="text" name="projectName"></li>
			<li><input type="submit" value="전송"></li>
			<li><a href="./insert.jsp">입력</a></li>
			<li><a href="./update.jsp">수정</a></li>
			<li><a href="./delete.jsp">삭제</a></li>
		</ul>
	</form>
	
</body>
</html>