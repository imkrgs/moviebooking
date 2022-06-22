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
<title>Your's next cinema : Booking Status</title>
</head>
<c:set var="mshow" scope="request" value="${requestScope.mshow}" />
<c:set var="date" scope="request" value="${requestScope.date}" />
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<main class="main-content">
			<div class="container">
				<h1 class="text-center">Booking Confirmed !</h1>
				<div class="row">
					<div class="col">
						<div class="card mb-3">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="${mshow.getPoster()}" class="img-fluid rounded-start"
										alt="${movie.getTitle()}" />
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h2 class="card-title">
											<c:out value="${mshow.getTitle()}" />
										</h2>
										<p class="card-text">
											Movie Plot :
											<c:out value="${mshow.getPlot()}" />
											<br> <br> Movie genre :
											<c:out value="${mshow.getGenre()}" />
											<br> <br> Movie Language :
											<c:out value="${mshow.getLanguage()}" />
											<br> <br> Movie Price :
											<c:out value="${mshow.getPrice()}" />
											<br> <br>Movie show time :
											<c:out value="${mshow.getShowTime()}" />
											<br> <br>Movie Date :
											<c:out value="${date}" />
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="d-grid gap-2 col-6 mx-auto mt-10 ">
									<a class="button text-center" href="home">Back To Home </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .container -->
		</main>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>