<%@page import="com.org.dto.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i
			class="fa-solid fa-truck-medical"></i>Hospital</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admin_login.jsp"><i
						class="fa-solid fa-right-to-bracket"></i>Admin</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="doctor_login.jsp"><i
						class="fa-solid fa-user-doctor"></i>Doctor</a></li>


				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_login.jsp"><i
						class="fa-solid fa-user"></i>User</a></li>

			</ul>

		</div>
	</div>
</nav>
