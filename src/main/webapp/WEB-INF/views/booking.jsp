<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%
user u1 = (user) session.getAttribute("current-user");
if (u1 == null) {
	com.project.entity.message m = new com.project.entity.message();
	m.setContent("Please Login To View Your Booking's !!! ");
	m.setType("danger");
	session.setAttribute("message", m);
	response.sendRedirect("home");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@include file="../resources/component/common_css_js.jsp"%>
<title>Your's next cinema : Booking</title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
			<div class="container bg-white rounded-3">
				<h1 class="text-center mt-5 mb-5">Your Booking's</h1>
				<div class="row justify-content-around">
					<div class="col-12">
						<div class="">
							<c:forEach var="movie" items="${bookedmovie}">
								<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
									<div class="card">
										<a href="single?movieId=${movie.getImdbID()}"><img
											width="200" height="200" src="${movie.getPoster()}"
											alt="${movie.getTitle()}" class="card-img-top" /></a>
										<div class="card-body">
											<h3 class="card-title">
												Name :${movie.getTitle()}<br>
												Date :${movie.getDate()}<br>
												Language :${movie.getLanguage()}<br>
												Price :${movie.getPrice()}
											</h3>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- .container -->
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>