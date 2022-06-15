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
		       <a class="index-links" href="/login">Login</a> | <a class="index-links" href="/registration">Register</a>
		  </div>
	</header>
	<main>
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
						<td> 
							<div class="d-flex align-items-center">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16" id="smile">
	                             <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	                             <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
	                             </svg> ${alert.alertCreator.userName}</td>
                             </div>
						<td>${alert.festivalName}</td>
						<td>${alert.description}</td>
						<td>${alert.igHandle}</td>
					</tr>	
				</c:forEach>
		    </tbody>
		</table>
		<div class="d-flex justify-content-end">
			<a href="/" class="btn btn-primary">Home</a>
		</div>	
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