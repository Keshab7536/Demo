<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.org.dto.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.SpecialistDao"%>
<%@page import="com.org.dto.Doctor"%>
<%@page import="com.org.dao.DoctorDao"%>
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
<%@include file="navbar.jsp" %>

					<%
					int id=Integer.parseInt(request.getParameter("id"));
					DoctorDao dao=new DoctorDao();
					Doctor d=dao.fetchById(id);
					%>
					
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor</p>
						
						<%
						String str = (String) session.getAttribute("success");
						if (str != null) {
						%>
						<p class="text-center text-primary fs-5"><%=str%></p>
						<%
						session.invalidate();
						}
						%>

						<form action="../update_Doctor" method="post">
						  
								<input name="id" type="hidden" class="form-control" value="<%=d.getId()%>"  required>
						
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input name="name"
									type="text" class="form-control" value="<%=d.getName()%>"  required>
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input name="dob"
									type="date" class="form-control"  value="<%=d.getDob()%>"  required>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control"  value="<%=d.getSpecialist()%>" >
									<!-- <option>select</option> -->

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
									name="qualification" type="text" class="form-control"  value="<%=d.getQal()%>"  required>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input name="email"
									type="text" class="form-control"  value="<%=d.getEmail()%>"  required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input name="mobile"
									type="text" class="form-control"  value="<%=d.getMobile()%>"  required>
							</div>
							<div class="mb-3">
								<label class="form-label">password</label> <input
									name="password" type="password" class="form-control"  value="<%=d.getPassword()%>"  required>
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>