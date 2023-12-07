<%@page import="com.org.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin:UserDetails</title>
<%@include file="../components/allCss.jsp" %>
<style type="text/css">
	.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
	</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center">User List</p>
						<table class="table">
							<thead>
								<tr>
									<th>Id</th>
									<th>Full Name</th>
									<th>Aadhar</th>
									<th>Email</th>
									<th>Password</th>
									<th>Mobile</th>
								</tr>
							</thead>
							<tbody>
								<%
								UserDao dao=new UserDao();
								List<User> list=dao.fetchAllUser();
							for(User us:list){	%>
									<tr>
									<td><%=us.getId()%></td>
									<td><%=us.getName()%></td>
									<td><%=us.getAdhar()%></td>
									<td><%=us.getEmail()%></td>
									<td><%=us.getPassword()%></td>
									<td><%=us.getMobile()%></td>
									</tr>
								<% 
							}
								
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- <div class="col-md-3 p-3">
				<img src="../img/stethoscope-840125_1920.jpg" alt="" height="500px" width="350px">
			</div> -->
		</div>
	</div>
</body>
</html>