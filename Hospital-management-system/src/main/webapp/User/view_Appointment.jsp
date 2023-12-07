<%@page import="com.org.dto.Appointment"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../components/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital-1802679_1280.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="user_navbar.jsp"%>

	<!-- <div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div> -->
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>appointment date</th>
									<th>diseases</th>
									<th>doctor Name</th>
									<th>status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user1=(User)session.getAttribute("userObj");
								AppointmentDao dao=new AppointmentDao();
								List<Appointment> list=dao.fetchAppointmentByUser(user1);
								for(Appointment ap:list){
									%>
									<tr>
									<td><%=ap.getName() %></td>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getDate() %></td>
									<td><%=ap.getDis()%></td>
									<td><%=ap.getDoctorName()%></td>
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