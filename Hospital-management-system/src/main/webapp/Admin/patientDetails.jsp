<%@page import="com.org.dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="com.org.dto.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: patient</title>
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
						<p class="fs-4 fw-bold text-center">Patient List</p>
						<table class="table">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Appointment date</th>
									<th>Diseases</th>
									<th>Email</th>
									<th>Address</th>
									<th>Doctor Name</th>
									<th>Mobile</th>
									<th>status</th>
								</tr>
							</thead>
							<tbody>
								<%
								
								AppointmentDao dao=new AppointmentDao();
								List<Appointment> list=dao.fetchAllAppointment();
								for(Appointment ap:list){
									%>
									<tr>
									<td><%=ap.getName() %></td>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getDate() %></td>
									<td><%=ap.getDis()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getAddress()%></td>
									<td><%=ap.getDoctorName()%></td>
									<td><%=ap.getPhone()%></td>
									<td class="text-danger"><%=ap.getStatus()%></td>
									
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