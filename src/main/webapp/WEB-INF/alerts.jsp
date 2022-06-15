<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FestiConnect</title>
<link href="https://fonts.googleapis.com/css2?family=Old+Standard+TT:ital,wght@0,400;0,700;1,400&family=Open+Sans&family=Pathway+Gothic+One&family=Playfair+Display:wght@500&family=Righteous&display=swap" rel="stylesheet"><link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
	      <h1>FestiConnect</h1>
	      <form:form class="search-bar" action="/searchAlert" method="post">
				<input type="search" class="search-field" id="festivalName" name="festivalName" placeholder="Festival Name"/>
				<button type="submit" class="mag-button"><img src="/img/search-dark.png" alt="mag-glass" class="mag-glass"></button>
		   </form:form>
	      <div class="col-md-3 text-end">
	        <a href="/dashboard" class="btn btn-primary me-2">Dashboard</a>
	        <a href="/logout" class="btn btn-primary">Logout</a>
	      </div>
	</header>
	<main>
		<!-- <h3 class="text-center title-pages">Solo Festies</h3> -->
		<table class="table table-hover">
		    <thead>
		        <tr>
		            <th>Solo Festi</th>
					<th>Festival Name</th>
					<th>Description</th>
					<th>IG Handle</th>
		        </tr>
		    </thead>
		    <tbody>
				<c:forEach var="alert" items="${alerts}">
					<tr>
						<td>${alert.alertCreator.userName}</td>
						<td>${alert.festivalName}</td>
						<td>${alert.description}</td>
						<td>${alert.igHandle}</td>
					</tr>	
				</c:forEach>
		    </tbody>
		</table>
			 <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 mt-5">
		        <div class="col">
		          <div class="card shadow-sm">
		          <img class="img-fluid" src="/img/coachella.jpeg" alt="coachella">
		          </div>
		        </div>
		        <div class="col">
		          <div class="card shadow-sm">
					<img class="img-fluid" src="/img/tmrwland.jpeg" alt="tmrwland">
		          </div>
			    </div><div class="col">
		          <div class="card shadow-sm">
		           	<img class="img-fluid" src="/img/stagecoachh.jpeg" alt="stagecoach">
		          </div>
		        </div>
		        <div class="col">
		          <div class="card shadow-sm">
				   	<img class="img-fluid" src="/img/ibiza.jpeg" alt="ibiza">
		          </div>
		        </div>
	     	</div>
	</main>
	<footer class="py-3 my-4 border-top text-center">
		<span class="mb-3 mb-md-0 text-muted">© 2022 Zainab Mirza</span>
  	</footer>
</div>
</body>
</html>