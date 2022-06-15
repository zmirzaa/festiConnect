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
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="container">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-2 border-bottom">
	      <h1>FestiConnect</h1>
	      <div class="col-md-3 text-end">
	        <a href="/login" class="btn btn-primary me-2">Login</a>
	        <a href="/registration" class="btn btn-primary">Register</a>
	      </div>
	    </header>
	    <main>
	    	<h3 class="text-center mt-3 mb-0">Solo festi-goer? <a href="/registration" class="index-links" >Register</a> to post a FestiConnect alert!</h3>
	    	<div class="row row-cols-1 row-cols-lg-2 align-items-stretch g-4 py-5">
	   			<div class="col">
			        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg">
			          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
			            <h2 class="pt-5 mt-5 mb-2 display-6 lh-1 fw-bold">Search for Festie Reviews</h2>
			           <form:form class="search-bar" action="/searchReview" method="post">
						    <input type="search" class="search-field" id="festivalName" name="festivalName" placeholder="Festival Name"/>
						    <button type="submit" class="mag-button"><img src="/img/search-dark.png" alt="mag-glass" class="mag-glass"></button>
					   </form:form>
			            <ul class="d-flex list-unstyled mt-auto">
			              <li class="d-flex align-items-center me-3">
			                <small><a class="index-links" href="login">Login</a> to post a review</small>
			              </li>
			            </ul>
			          </div>
			        </div>
	      		</div>
	      		<div class="col">
			        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-4 shadow-lg">
			          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
			            <h2 class="pt-5 mt-5 mb-2 display-6 lh-1 fw-bold">Looking for Festie Besties?</h2>
			            <form:form class="search-bar" action="/searchAlert" method="post">
						  <input type="search" class="search-field" id="festivalName" name="festivalName" placeholder="Festival Name"/>
						  <button type="submit" class="mag-button"><img src="/img/search-dark.png" alt="mag-glass" class="mag-glass"></button>
					   	</form:form>
			            <ul class="d-flex list-unstyled mt-auto">
			              <li class="d-flex align-items-center me-3">
			                <small><a class="index-links" href="login">Login</a> to post a solo alert</small>
			              </li>
			            </ul>
			          </div>
			        </div>
			      </div>
	    	</div>
	   	    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		        <div class="col">
		          <div class="card shadow-sm">
		          <img class="img-fluid" src="/img/escape.jpeg" alt="escape-pic">
		          </div>
		        </div>
		        <div class="col">
		          <div class="card shadow-sm">
		           	<img class="img-fluid" src="/img/edcc.jpeg" alt="edc-pic">
		          </div>
		        </div>
		        <div class="col">
		          <div class="card shadow-sm">
					<img class="img-fluid" src="/img/beyond.jpeg" alt="beyond-pic">
		          </div>
			    </div>
		        <div class="col">
		          <div class="card shadow-sm">
				   	<img class="img-fluid" src="/img/nocturnall.jpeg" alt="nocturnal-pic">
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