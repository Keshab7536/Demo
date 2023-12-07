<%@page import="com.org.dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allCss.jsp" %>
</head>
<body>
<%@include file="Doctor_navbar.jsp" %>
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
									<th>status</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor doctor=(Doctor)session.getAttribute("doctorObj");
								AppointmentDao dao=new AppointmentDao();
								List<Appointment> list=dao.fetchAppointmentByDoctor(doctor);
								for(Appointment ap:list){
									%>
									<tr>
									<td><%=ap.getName() %></td>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getDate() %></td>
									<td><%=ap.getDis()%></td>
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