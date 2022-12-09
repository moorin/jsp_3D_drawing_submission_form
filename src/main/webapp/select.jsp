<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Select</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<table width="300" border="1">
		<tr>
			<th>번호</th>
			<th>견적상태</th>
			<th>프로젝트명</th>
			<th>제품 용도</th>
			<th>납기일</th>
			<th>추정예산범위 1</th>
			<th>추정예산범위 2</th>
			<th>도면 상세 정보</th>
			<th>연락처</th>
			<th>이름</th>
			<th>등록일</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			try {
				String sql = "select num, project_name, product_use, deadline_date, estimated_budget_range_1, estimated_budget_range_2, drawing_detail_information, phone_number, name, regist_day, quote_status from quote";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int num = rs.getInt("num");
					String project_name = rs.getString("project_name");
					String product_use = rs.getString("product_use");
					String deadline_date = rs.getString("deadline_date");
					String estimated_budget_range_1 = rs.getString("estimated_budget_range_1");
					String estimated_budget_range_2 = rs.getString("estimated_budget_range_2");
					String drawing_detail_information = rs.getString("drawing_detail_information");
					String phone_number = rs.getString("phone_number");
					String name = rs.getString("name");
					String regist_day = rs.getString("regist_day");
					String quote_status = rs.getString("quote_status");
		%>
		<tr>
			<td><%=num%></td>
			<td><%=quote_status%></td>
			<td><%=project_name%></td>
			<td><%=product_use%></td>
			<td><%=deadline_date%></td>
			<td><%=estimated_budget_range_1%></td>
			<td><%=estimated_budget_range_2%></td>
			<td><%=drawing_detail_information%></td>
			<td><%=phone_number%></td>
			<td><%=name%></td>
			<td><%=regist_day%></td>
		</tr>
		<%
				}
			} catch (SQLException ex) {
				out.println("테이블 호출이 실패했습니다.<br>");
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
	</table>
</body>
</html>