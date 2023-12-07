<%@page import="com.org.dao.SpecialistDao"%>
<%@page import="com.org.dto.Specialist"%>
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
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<%
						String str = (String) session.getAttribute("success");
						if (str != null) {
						%>
						<p class="text-center text-primary fs-5"><%=str%></p>
						<%
						session.removeAttribute("success");
						}
						%>


						<form action="../doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input name="name"
									type="text" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input name="dob"
									type="date" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control">
									<option>select</option>

									<%
									SpecialistDao sp = new SpecialistDao();
									List<Specialist> list = sp.getAllSpecialist();
									for (Specialist s : list) {
									%>

									<option><%=s.getName()%></option>
									<%
									}
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									name="qualification" type="text" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input name="email"
									type="text" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input name="mobile"
									type="text" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Register</button>

						</form>
					</div>
				</div>
			</div>
			

		</div>


	</div>

</body>
</html>