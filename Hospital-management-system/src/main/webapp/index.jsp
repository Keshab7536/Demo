<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="components/allCss.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/Hospital management.png" class="d-block w-100" alt="..." height="400px" width="200px">
    </div>
    <div class="carousel-item">
      <img src="img/img 1.jpeg" class="d-block w-100" alt="..." height="400px" width="300px">
    </div>
    <div class="carousel-item">
      <img src="img/img 3.jpeg" class="d-block w-100" alt="..." height="400px" width="200px">
    </div>
     <div class="carousel-item">
      <img src="img/img 4.jpeg" class="d-block w-100" alt="..." height="400px" width="200px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</body>
</html>