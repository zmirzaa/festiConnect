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
<div class="container-fluid">
      <nav id="navbar" class="navbar navbar-light px-3 border-bottom">
      	<div class="title">
	        <h1>FestiConnect</h1>  
	        <div class="d-flex align-items-center">
		        <span class="fw-bold">Hey Festi ${loginUser.userName}!</span> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-sunglasses" viewBox="0 0 16 16">
	  			<path d="M4.968 9.75a.5.5 0 1 0-.866.5A4.498 4.498 0 0 0 8 12.5a4.5 4.5 0 0 0 3.898-2.25.5.5 0 1 0-.866-.5A3.498 3.498 0 0 1 8 11.5a3.498 3.498 0 0 1-3.032-1.75zM7 5.116V5a1 1 0 0 0-1-1H3.28a1 1 0 0 0-.97 1.243l.311 1.242A2 2 0 0 0 4.561 8H5a2 2 0 0 0 1.994-1.839A2.99 2.99 0 0 1 8 6c.393 0 .74.064 1.006.161A2 2 0 0 0 11 8h.438a2 2 0 0 0 1.94-1.515l.311-1.242A1 1 0 0 0 12.72 4H10a1 1 0 0 0-1 1v.116A4.22 4.22 0 0 0 8 5c-.35 0-.69.04-1 .116z"/>
	  			<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-1 0A7 7 0 1 0 1 8a7 7 0 0 0 14 0z"/>
				</svg>
			</div>     
        </div>
        <ul class="nav nav-pills"> 
          <li class="nav-item">
            <a class="nav-link" href="#scrollspyHeading2">search</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#scrollspyHeading3">post reviews</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#scrollspyHeading4">post solo festi alert</a>
          </li>
        </ul>
        <a href="/logout" class="btn btn-primary">logout</a>  
      </nav>
      <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-offset="0" class="scrollspy-example" tabindex="0">
    		
        <div class="row row-cols-1 row-cols-lg-2 align-items-stretch g-4 py-5">
        		<div class="col">
	        		<div class="list-group w-auto"> 
		        		<h6 class="text-center fw-bold">your reviews</h6>
			        	<c:forEach var="review" items="${allReviews}">
				        	<c:if test="${loginUser.id == review.reviewCreator.id}">
							  <a href="/review/${review.id}" class="list-group-item list-group-item-action d-flex gap-3 py-3 bg-dark text-white" aria-current="true">
							    <div class="d-flex gap-2 w-100 justify-content-between align-items-center">
							      <div>
							        <h6 class="mb-0 review">${review.festivalName} ${review.yearAttended}</h6>
							        <p class="mb-0 text-muted">${review.likers.size()} like(s)</p>
							        <p class="mb-0 text-muted">${review.comments.size()} comment(s)</p>
							      </div>
							      <small>
							      	<form:form action="/delete/${review.id}" method="delete">
										<button class="btn btn-secondary">Delete</button>
									</form:form>
								  </small>
							    </div>
							   </a>
				        	</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="col">
				<div class="list-group w-auto"> 	
					<h6 class="text-center fw-bold">your solo alerts</h6>
					<c:forEach var="alert" items="${alerts}">
						<c:if test="${loginUser.id == alert.alertCreator.id}">
							 <a href="#" class="list-group-item d-flex gap-3 py-3 bg-dark" aria-current="true">
							 <div class="d-flex gap-2 w-100 justify-content-between align-items-center">
								 <div>
									 <h6 class="mb-0 list">${alert.festivalName}</h6>
									 <p class="mb-0 text-muted">${alert.description}</p>
								 </div>
								 <form:form action="/delete/alert/${alert.id}" method="delete">
								 	<button class="btn btn-secondary">Delete</button>
								 </form:form>
							  </div> 
							  </a>
						</c:if>
					</c:forEach>
	       		 </div>
       		 </div>
       	</div>
       	<a href="https://www.hardsummer.com/"><img src="img/hard.jpeg" class="dash-pics img-fluid rounded" alt="crowd-pic"></a>
        <div class="row py-lg-5"  id="scrollspyHeading2">
        		<div class="d-flex gap-5 justify-content-evenly mb-5 mt-5 text-center">
        	   		<div>
		        		<h4>Search Festival Reviews</h4>
		        		<h6 class="fw-light"><em>Get tips and be prepared for your next festival</em></h6>
					<form:form class="search-bar mx-auto" action="/searchReview" method="post">
					<input type="search" class="search-field" id="festivalName" name="festivalName" placeholder="Festival Name"/>
					<button type="submit" class="mag-button"><img src="/img/search-dark.png" alt="mag-glass" class="mag-glass"></button>
					</form:form>
				</div>
				<div>
				  <h4>Search For Solo Festi Alerts</h4>
        			  <h6 class="fw-light"><em>Find your next festie bestie!</em></h6>
			      <form:form class="search-bar mx-auto" action="/searchAlert" method="post">
				  <input type="search" class="search-field" id="festivalName" name="festivalName" placeholder="Festival Name"/>
				  <button type="submit" class="mag-button"><img src="/img/search-dark.png" alt="mag-glass" class="mag-glass"></button>
				  </form:form>
				</div>
	    		</div>
	    </div>
	   <a href="https://www.projectzfest.com/"><img src="img/project.jpeg" class="dash-pics img-fluid rounded" alt="crowd-pic"></a>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5" id="scrollspyHeading3">
			<div class="row align-items-center g-lg-5 py-5">
				<div class="col-lg-7 text-center text-lg-start">
					<h1 class="display-4 fw-bold lh-1 mb-3"><span>Post New Review</span></h1>
					<p class="col-lg-10 fs-4">Hey Festi ${loginUser.userName}! Thank you for taking the time to tell us about your festival experience. Include tips to further help your fellow festies</p>
				</div>
				<div class="col-md-10 mx-auto col-lg-5">
	       			<form:form class="p-4 p-md-5 border rounded-3 bg-dark" action="/createReview" method="post" modelAttribute="review">
	        		  	<form:input value="${loginUser.id}" path="reviewCreator" type="hidden"/>
	        		  	  <div>
			          	<form:errors class="text-danger" path="festivalName"/>
			          </div>
			          <div class="form-floating mb-3">
			            <form:input path="festivalName" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="festivalName">Name of Festival</form:label>
			          </div>
			          <div>
			          	<form:errors class="text-danger" path="yearAttended"/>
			          </div>
			          <div class="form-floating mb-3">
			            <form:input path="yearAttended" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="yearAttended">Year Attended</form:label>
			          </div>
			          <div>
			          	<form:errors path="rating" class="text-danger"/>
			          </div>
			         <div class="form-floating mb-3">
			            <form:input type="number" min="1" max="10" path="rating" class="form-control" id="floatingNumber2"/>
			            <form:label for="floatingNumber2" path="rating">Overall Rating</form:label>
			          </div>
			         <div>
				        <form:errors class="text-danger" path="description"/>
				      </div> 
			         <div class="form-floating mb-3">
			          	<form:textarea type="textarea" path="description" class="form-control" id="floatingTextarea2" style="height: 100px"/>
				        <form:label for="floatingTextarea2" path="description">Details</form:label>
				     </div>
				     <div>
				     <form:errors class="text-danger" path="tips"/>
				     </div>
			          <div class="form-floating mb-3">
			            <form:textarea type="textarea" path="tips" class="form-control" name="floatingTextarea2" style="height: 100px"/>
			            <form:label for="floatingTextarea2" path="tips">Any Tips?</form:label>
			          </div>
			          <button class="w-100 btn btn-lg btn-primary" type="submit">Post</button>
			        </form:form>
			      </div>
			</div>
		</div>
		<a href="https://www.nocturnalwonderland.com/"><img src="img/nocc.png" class="dash-pics img-fluid rounded" alt="crowd-pic"></a>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5" id="scrollspyHeading4">
			<div class="row align-items-center g-lg-5 py-5">
				<div class="col-lg-7 text-center text-lg-start">
					<h1 class="display-4 fw-bold lh-1 mb-3"><span>Solo Festi Alert</span></h1>
					<p class="col-lg-10 fs-4">Hey solo festi! Post an alert and include your instagram handle so your fellow festies can find you and reach out. Provide details by introducing yourself and specifying your needs.</p>
				</div>
				<div class="col-md-10 mx-auto col-lg-5">
			        <form:form class="p-4 p-md-5 border rounded-3 bg-dark" action="/createAlert" method="post" modelAttribute="alert">
			        	<form:input value="${loginUser.id}" path="alertCreator" type="hidden"/>
			          <div class="form-floating mb-3">
			            <form:input path="festivalName" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="festivalName">Name of Festival</form:label>
			          </div>
			          <div>
			          	<form:errors class="text-danger" path="festivalName"/>
			          </div>
			          <div class="form-floating mb-3">
			            <form:input path="igHandle" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="igHandle">IG Username</form:label>
			          </div>
			          <div>
			          	<form:errors class="text-danger" path="igHandle"/>
			          </div>
			          <div class="form-floating mb-3">
			            <form:textarea type="textarea" path="description" class="form-control" id="floatingTextarea2" style="height: 100px"/>
			            <form:label for="floatingTextarea2" path="description">Details</form:label>
			          </div>
			          <div>
			          	<form:errors class="text-danger" path="description"/>
			          </div>
			          <button class="w-100 btn btn-lg btn-primary" type="submit">Post</button>
			        </form:form>
      			</div>
			</div>
		</div>
      </div>
      <footer class="py-3 my-4 border-top text-center">
		<span class="mb-3 mb-md-0 text-muted">© 2022 Zainab Mirza</span>
  	</footer>
    </div>
</body>
</html>