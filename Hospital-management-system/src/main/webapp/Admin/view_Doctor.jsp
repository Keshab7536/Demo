<%@page import="com.org.dto.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Details</title>
<%@include file="../components/allCss.jsp" %>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						
						<table class="table">
							<thead class="bg-primary text-white text-center">
								<tr>
									<th>Id</th>
									<th>Full Name</th>
									<th>DOB</th>
									<th>Qulification</th>
									<th>Specialist</th>
									<th>Email</th>
									<th>Mobile No</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao = new DoctorDao();
								List<Doctor> list1 = dao.getAllDetails();
								for (Doctor d : list1) {
								%>

								<tr>
									<td><%=d.getId()%></td>
									<td><%=d.getName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQal()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobile()%></td>
									<td><a href="Edit_Doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary"><i
											class="fa-solid fa-pen-to-square"></i> Edit</a> <a
										href="../Delete_doctor?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger"><i
											class="fa-solid fa-trash-can"></i> Delete</a></td>

								</tr>

								<%
								}
								%>

							</tbody>
						</table>

					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>