<%@page import="com.org.dto.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@ include file="../components/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

/* .backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
} */
</style>
</head>
<body>


	<%@ include file="user_navbar.jsp"%>
	<!-- <div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>

	</div> -->
	<div class="container p-3">
		<div class="row">
			<!-- <div class="col-md-6 p-5">
				<img src="img/doctor.jpg" alt="" height="500px" width="400px">
			</div> -->
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						
						<%
						String str=(String)session.getAttribute("success");
						
						if (str != null){%>
							<p class="text-center text-primary fs-5"><%=str%></p>
						<%
						session.removeAttribute("success");
						}%>
						
						<form action="../user_ap" class="row g-3" method="post">
							<input type="hidden" name="id" value="">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									type="text" required class="form-control" name="name">
							</div>
							<div class="col-md-6">
								<label>Gender</label> <select name="gender" class="form-control"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									type="text" required class="form-control" name="age">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" required class="form-control"
									name="appoint_date">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" required class="form-control" name="email">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone</label> <input
									type="text" required class="form-control" name="phone">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									type="text" required class="form-control" name="disease">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label><br>
								<select name="doct">
									<option value="">Select</option>
									<%DoctorDao dao=new DoctorDao();
										List<Doctor> list=dao.getAllDetails();
									for(Doctor d:list){%>
									<option value="<%=d.getId()%>"><%=d.getName()%> (<%=d.getSpecialist()%>)</option>
									
									<%}%>
									
									
									
								</select>
							</div>
							<div class="col-md-12">
								<label for="">FullAddress</label>
								<textarea name="address" class="form-control" cols="" rows="3"></textarea>
							</div>
							<input type="hidden" name="userId" value="<%=user.getId()%>">
							<button class="col-md-6 offset-md-3 btn btn-primary">
								Submit</button>
						</form>
					</div>

				</div>

			</div>

		</div>
	</div>


</body>
</html>