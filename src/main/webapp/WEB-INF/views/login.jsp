<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../resources/component/forms_css_js.jsp"%>
<%@include file="../resources/component/common_css_js.jsp"%>
<title>LogIn</title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card mt-10">
					<%@include file="../resources/component/message.jsp"%>
					<div class="card-header"
						style="background-color: rgb(121, 121, 121)">
						<h3>Sign In</h3>
						<div class="d-flex justify-content-end social_icon">
							<span><i class="fab fa-facebook-square"></i></span> <span><i
								class="fab fa-google-plus-square"></i></span> <span><i
								class="fab fa-twitter-square"></i></span>
						</div>
					</div>
					<div class="card-body">
						<form action="loginresponse">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="username"
									name="username" />
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" class="form-control"
									placeholder="password" name="password" />
							</div>
							<div class="form-group">
								<input type="submit" value="Login"
									class="btn float-right login_btn" />
							</div>
						</form>
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							Don't have an account?<a href="signup">Sign Up</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>