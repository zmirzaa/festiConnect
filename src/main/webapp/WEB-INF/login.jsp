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
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="px-4 py-5 my-5 text-center">
		    <h1 class="display-5 fw-bold">FestiConnect</h1>
		    <div class="col-lg-6 mx-auto">
		      <p class="lead mb-4">Welcome back fellow Festie! We missed you.</p>
		      <div class="d-grid gap-2 d-flex justify-content-center">
		        <form:form class="p-4 p-lg-5 border rounded-3 bg-light" action="/login" method="post" modelAttribute="loginUser">
		          <div class="form-floating mb-3">
		            <form:input type="email" path="email" class="form-control" id="floatingInput" placeholder="name@example.com"/>
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
		          <div class="checkbox mb-3">
		            <label>
		              <input type="checkbox" value="remember-me"> Remember me
		            </label>
		          </div>
		          <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
		          <hr class="my-4">
		          <small class="text-muted">New here? Register <a href="/registration">here.</a></small>
		        </form:form>
      		 </div>
		  </div>
		</div>
	</div>
</body>
</html>