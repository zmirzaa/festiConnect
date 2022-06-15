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
	      <div class="col-md-3 text-end">
	        <a href="/" class="btn btn-primary me-2">Home</a>
	        <a href="/registration" class="btn btn-primary">Register</a>
	      </div>
	</header>
	<main>
	<div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto text-center" id="view">
        <h2 class="fw-light title-pages">${review.festivalName} ${review.yearAttended}</h2>
	        <h5 class="fw-light"> ${review.reviewCreator.userName} posted:</h5>		        
	        <p class="lead text-muted"><em>${review.description}</em> </p> 
	        <div> 
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb" viewBox="0 0 16 16">
 				 <path d="M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13a.5.5 0 0 1 0 1 .5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 				0 0 1 0-1 .5.5 0 0 1 0-1 .5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6zm6-5a5 5 0 0 0-3.479 8.592c.263.254.514.564.676.941L5.83 12h4.342l.632-1.467c.					    162-.377.413-.687.676-.941A5 5 0 0 0 8 1z"/>
				</svg>
				${review.tips}
			</div>
	        <p class="fw-light">Overall Rating: ${review.rating}/10</p>
        </div>
	    <div class="col mx-auto">
	    	<div class="card">
	    		<div class="card-body">		    		
					<c:forEach var="c" items="${review.comments}">
						<p>${c.commentCreator.userName}: <em>${c.description}</em></p>
					</c:forEach>
	    		</div>
	    	</div>
	    	<small><a class="index-links" href="/login">Login</a> or <a class="index-links" href="/registration">Register</a> to like and comment!</small>
		 </div>
    	</div>
    	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3 mt-5">
		        <div class="col">
		          <div class="card shadow-sm">
		          <img class="img-fluid" src="/img/nye.jpeg" alt="nye">
		          </div>
		        </div>
		        <div class="col">
		          <div class="card shadow-sm">
					<img class="img-fluid" src="/img/ultra.jpeg" alt="ultra">
		          </div>
			    </div><div class="col">
		          <div class="card shadow-sm">
		           	<img class="img-fluid" src="/img/redrock.jpeg" alt="redrock">
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