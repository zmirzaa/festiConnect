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
<link href="https://fonts.googleapis.com/css2?family=Old+Standard+TT:ital,wght@0,400;0,700;1,400&family=Open+Sans&family=Pathway+Gothic+One&family=Playfair+Display:wght@500&family=Righteous&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container col-xl-10 col-xxl-8 px-4 py-5">
	<div class="row align-items-center g-lg-5 py-5">
		<div class="col-lg-7 text-center text-lg-start">
			<h1 class="display-4 fw-bold lh-1 mb-3"><span>FestiConnect</span></h1>
			<p class="col-lg-10 fs-4">Calling all festie lovers! A place where you can post festival reviews and connect with your fellow festies.</p>
			<a class="btn btn-primary" href="/">Home</a>
		</div>
		<div class="col-md-10 mx-auto col-lg-5">
        <form:form class="p-4 p-md-5 border rounded-3 bg-light" action="/register" method="post" modelAttribute="user">
          <div class="form-floating mb-3">
            <form:input path="userName" class="form-control" id="floatingInput" placeholder="Username"/>
            <form:label for="floatingInput" path="userName">Username</form:label>
          </div>
          <div>
          	<form:errors class="text-danger" path="userName"/>
          </div>
          <div class="form-floating mb-3">
            <form:input type="email" path="email" class="form-control" id="floatingInput" placeholder="Email Address"/>
            <form:label for="floatingInput" path="email">Email address</form:label>
          </div>
          <div>
          	<form:errors class="text-danger" path="email"/>
          </div>
          <div class="form-floating mb-3">
            <form:password path="password" class="form-control" id="floatingPassword" placeholder="Password"/>
            <form:label for="floatingPassword" path="password">Password</form:label>
          </div>
          <div>
          	<form:errors class="text-danger" path="password"/>
          </div>
          <div class="form-floating mb-3">
            <form:password path="confirm" class="form-control" id="floatingPassword" placeholder="Password"/>
            <form:label for="floatingPassword" path="confirm"> Confirm Password</form:label>
          </div>
          <div>
          	<form:errors class="text-danger" path="confirm"/>
          </div>
          <button class="w-100 btn btn-lg btn-primary" type="submit">Register & Login</button>
          <hr class="my-4">
          <small class="text-muted">Already a member? Login <a href="/login">here.</a></small>
        </form:form>
      </div>
	</div>
</div>
</body>
</html>