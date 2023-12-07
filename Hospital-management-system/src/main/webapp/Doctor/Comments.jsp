<%@page import="com.org.dao.AppointmentDao"%>
<%@page import="com.org.dto.Appointment"%>
<%@page import="com.org.dto.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comment Page</title>
<%@ include file="../components/allCss.jsp"%>
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
	Doctor str = (Doctor) session.getAttribute("doctorObj");
	if (str == null) {
		response.sendRedirect("../doctor_login.jsp");
	} else {
	%>

	<%@ include file="Doctor_navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>

	</div>
	
	<%
	String st=request.getParameter("apId");
	int apId=Integer.parseInt(st);
	 AppointmentDao dao=new AppointmentDao();
	Appointment ap= dao.fetchById(apId);
	%>
	<div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-4">
                            Patient Comment
                        </p>
                        <form action="../update_comments" class="row" method="post">
                            <div class="col-md-6">
                                <label>Patient Name</label>
                                <input type="text" readonly value="<%=ap.getName()%>" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Age</label>
                                <input type="text" readonly value="<%=ap.getAge()%>" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Mobile</label>
                                <input type="text" readonly value="<%=ap.getPhone()%>" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label>Diseases</label>
                                <input type="text" readonly value="<%=ap.getDis()%>" class="form-control">
                            </div>
                             <div class="col-md-12">
                                <label>Comment</label>
                                <textarea name="comment" id=""  rows="3" class="form-control"></textarea>
                            </div>
                            <input type="hidden" name="apId" value=<%=apId%>>
                            <button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



	<%
	}
	%>
</body>
</html>
