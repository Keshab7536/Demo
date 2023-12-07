<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%
	User us = (User) session.getAttribute("userObj");
	%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="car paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>
						<%
						String str = (String) session.getAttribute("failed");
						if (str != null) {
						%>

						<p class="text-center text-primary fs-6"><%=str%></p>

						<%
						session.removeAttribute("failed");
						}
						%>
						<form action="../ChangePassword" method="post">
							<input type="hidden" name="uid" value="<%=us.getId()%>">
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									name="opd" type="password" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									name="npd" type="password" class="form-control" required>
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