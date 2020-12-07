<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String myctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
    <title>MVCWeb</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>




</head>

<body>
    <div style="margin:50px 5%;">
        <div class="row">
            <div class="col-xs-3" style="width:10%;">
            <div style="padding:0 1%;background:#ededed;border-radius:10px;position:fixed;top:220px;box-shadow:5px 7px rgba(50,50,90,0.2)">
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item active"><a class="nav-link"
						href="<%=myctx%>/index">Home</a></li>
					<c:if test="${loginUser eq null }">
					<li class="nav-item"><a class="nav-link"
						href="#mySignUpModal" data-toggle="modal">SignUp</a></li>
						<!--  eq연산자 : (equals) == 와 같다. -->
						<li class="nav-item"><a class="nav-link"
							href="#myLoginModal" data-toggle="modal">Login </a></li>
					</c:if>
					<c:if test="${loginUser ne null }">
						<!-- ne연산자: (not equals) != 와 같다. -->
						<li class="nav-item"><a class="nav-link" href="#">${loginUser.name}님</a></li>

						<li class="nav-item"><a class="nav-link"
							href="<%=myctx%>/logout">Logout</a></li>
					</c:if>
                </ul>
            </div>
            </div>
            <div class="col-xs-9" style="width:90%;padding:3%;background:#ededed;border-radius:10px;box-shadow:5px 7px rgba(50,50,90,0.2)">
