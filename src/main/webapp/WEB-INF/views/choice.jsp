<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@include file="../resources/component/common_css_js.jsp"%>
<c:set var="movie" scope="request" value="${requestScope.movie}" />
<style>
.column {
	float: left;
	width: 20%;
	padding: 0 10px;
	margin-bottom: 30px;
}

@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}
</style>
<title>Search Result</title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<div class="container bg-white rounded-3">
			<div class="row justify-content-center">
				<div class="col">
					<h1 class="text-center mt-5 mb-5">Search Result</h1>
				</div>
			</div>
			<div class="row justify-content-around">
				<div class="col-12">
					<div
						class="row ">
						<c:forEach var="listItem" items="${movie}">
							<c:if test="${listItem.get('Type').equalsIgnoreCase('movie')}">
							<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
								<div class="card rounded-2">
									<a href="single?movieId=${listItem.get('imdbID')}"> <img
										class="card-img-top" src="${listItem.get('Poster')}"
										alt="${listItem.get('imdbID')}" /></a>
									<h3 class="card-title text-center">${listItem.get("Title")}</h3>
								</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>