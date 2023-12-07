<%@page import="com.org.dao.counterDao"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="../components/allCss.jsp"%>
</head>
<body>

	<%
	User u = (User) session.getAttribute("adminObj");
	if (u == null) {
		response.sendRedirect("../admin_login.jsp");
	}
	%>
	<%
	String str = (String) session.getAttribute("success");
	if (str != null) {
	%>
	<p class="text-center text-primary fs-5"><%=str%></p>
	<%
	session.invalidate();
	}
	%>
	<%counterDao dao=new counterDao(); %>

	<%@include file="navbar.jsp"%>
	<h2 class="text-center text-primary">Admin DashBoard</h2>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-md fa-3x"></i> <br> 
						<p class="fs-4 text-center text-primary"><a href="doctor.jsp">
							Doctor</a><br><%=dao.countDoctor()%></p>
						
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fas fa-user-circle fa-3x"></i> <br>
						<p class="fs-4 text-center">
							<a href="TotalUser.jsp">Users</a><br><%=dao.countUser()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i> <br>
						<p class="fs-4 text-center">
							<a href="view_all_appointment.jsp">Total Appointment</a><br><%=dao.countAppointment() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i> <br>
						<p class="fs-4 text-center">
							Specialist<br><%=dao.countSpecialist()%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal Tittle</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../add_specialist" method="post">
						<div class="form-group">
							<label>Specialist name</label> <input type="text" name="specName"
								class="form-control">

						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">ADD</button>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>