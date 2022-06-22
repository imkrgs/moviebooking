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
<c:set var="map" scope="request" value="${requestScope.movie}" />
<c:set var="smovie" scope="request" value="${requestScope.smovie}" />
<title><c:out value="${map.get('Title')}" /></title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<main class="main-content">
			<div class="container">
				<div class="page">
					<div class="breadcrumbs">
						<a href="home">Home</a> <span><c:out
								value="${map.get('Title')}" /></span>
					</div>
					<div class="content">
						<div class="row">
							<div class="col-md-3 ">
								<figure class="movie-poster rounded">
									<img src="<c:out value = "${map.get('Poster')}"/>"
										alt="<c:out value = "${map.get('Title')}"/>">
								</figure>
							</div>
							<div class="col-md-6">
								<h2 class="movie-title">
									<c:out value="${map.get('Title')}" />
								</h2>
								<div class="movie-summary">
									<p>
										<c:out value="${map.get('Plot')}" />
									</p>
								</div>
								<ul class="movie-meta">
									<li><strong>BoxOffice:</strong> <c:out
											value="${map.get('BoxOffice')}" /></li>
									<li><strong>Rating:</strong> <c:out
											value="${map.get('imdbRating')}" />/10</li>
									<li><strong>Length:</strong> <c:out
											value="${map.get('Runtime')}" /></li>
									<li><strong>Premiere:</strong> <c:out
											value="${map.get('Released')}" /></li>
									<li><strong>Category:</strong> <c:out
											value="${map.get('Genre')}" /></li>
								</ul>

								<ul class="starring">
									<li><strong>Directors:</strong> <c:out
											value="${map.get('Director')}" /></li>
									<li><strong>Writers:</strong> <c:out
											value="${map.get('Writer')}" /></li>
									<li><strong>Cast:</strong> <c:out
											value="${map.get('Actors')}" /></li>
								</ul>
							</div>
						</div>
						<div class="entry-content">
							<div class="row">
								<h2 class="section-title text-center mt-3 mb-5">Similar
									Movies</h2>
								<hr />
								<c:forEach var="entry" items="${smovie.entrySet()}">
									<div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
										<div class="card">
											<a href='#'><img class="card-img-top"
												src="${entry.getValue()}" alt="${entry.getKey()}"></a>
											<div class="card-title text-center mt-2">${entry.getKey()}</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>

</html>

