<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
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
<title>Your's next cinema</title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<div class="container bg-white rounded-3">
			<%@include file="../resources/component/message.jsp"%>
			<div class="row justify-content-center mt-5">
				<div class="col">
					<h1 class="text-center mb-5 mt-5">In Theater's</h1>
				</div>
			</div>
			<div class="row justify-content-around">
				<div class="col-12">
					<div
						class="row">
						<c:forEach var="movie" items="${inTheaterMovie}">
							<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
								<div class="card">
									<a href="single?movieId=${movie.getImdbID()}"> <img
										class="card-img-top" width="200" height="200"
										src="${movie.getPoster()}" alt="${movie.getTitle()}" /></a>
									<div class="card-body text-center">
										<h3 class="card-title">${movie.getTitle()}</h3>
										<a class="button mt-2"
											href="seatbooking?movieId=${movie.getImdbID()}">Book Now</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row justify-content-center mt-5">
				<div class="col">
					<h1 class="text-center mt-5 mb-5">Upcoming Movie's <br></h1>
				</div>
			</div>
			<div class="row justify-content-around">
				<div class="col-10">
					<div
						class="row">
						<c:forEach var="movie" items="${upcoming}">
							<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
								<div class="card">
									<a href="single?movieId=${movie.getImdbID()}"> <img
										class="card-img-top" width="200" height="200"
										src="${movie.getPoster()}" alt="${movie.getTitle()}" /></a>
									<div class="card-body">
										<h3 class="card-title text-center">${movie.getTitle()}</h3>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>