<%@page import="com.org.dao.counterDao"%>
<%@page import="com.org.dto.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Home</title>
<%@include file="../components/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

/* .backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
} */
</style>
</head>
<body>
	<%
	Doctor doctor=(Doctor)session.getAttribute("doctorObj");
	if(doctor==null){
	response.sendRedirect("../doctor_login.jsp");
	
	}else{%>
	
	<%
	counterDao dao=new counterDao();
	%>
	
	<%@include file="Doctor_navbar.jsp"%>
	<p class="text-center fs-3">Doctor Dashboard</p>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">Doctor</p>
						<br>12
					</div>
				</div>
			</div>
			<div class="col-md-4 offset-md-1">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center"><a href="All_Appointment.jsp">Total Appointment</a></p>
						<br><%=dao.countAppointmentByDoctor(doctor)%>
					</div>
				</div>
			</div>

		</div>
	</div>
<%}%>

</body>
</html>