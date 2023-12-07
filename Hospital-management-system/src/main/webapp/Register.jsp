<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="components/allCss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="car paint-card" >
					<div class="card-body">
					<p class="fs-4 text-center">Register</p>
					
					<%
					String str=(String)session.getAttribute("success");
					if(str != null){
					%>  
					<p class="text-center text-primary fs-3"><%=str%></p>
					<%
					session.invalidate();
					} %>
						<form action="register" method="post">
							<div class="mb-3">
								<label class="form-label">FullName*</label>
								<input name="name" type="text" class="form-control" required>					
							</div>
							<div class="mb-3">
								<label class="form-label">Adhar No*</label>
								<input name="adhar" type="text" class="form-control" required>					
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No*</label>
								<input name="mobile" type="text" class="form-control" required>					
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email Address*</label>
								<input name="email" type="email" class="form-control" required>					
							</div>
							<div class="mb-3">
								<label class="form-label">Password*</label>
								<input name="password" type="password" class="form-control" required>					
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Register</button>
						</form>
							<p class="fs-8 text-center">Already Have An Account? <a class="text-decoration-none text-danger" href="user_login.jsp">Login</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>