<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Update process</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	
		String name = request.getParameter("name");
		String pwd = request.getParameter("password");
		String projectName = request.getParameter("projectName");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String sql = "select name, password, project_name from quote where name='"+name+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				String rName = rs.getString("name");
				String rPwd = rs.getString("password");
				String rProjectName = rs.getString("project_name");
				
				if(name.equals(rName) && pwd.equals(rPwd)) {
					sql = "update quote set project_name = '"+projectName+"'where name='"+name+"'";
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					out.println("테이블을 수정했습니다.");
				} else 
					out.println("일치하는 이름이 아닙니다.");
				} else 
					out.println("테이블에 일치하는 번호가 없습니다.");
			} catch (SQLException ex) {
				out.println("SQLException: "+ex.getMessage());
		} finally {
			if(rs!=null)
				rs.close();
			if(stmt!=null)
				stmt.close();
			if(conn!=null)
				conn.close();
		}
	%>
</body>
</html>