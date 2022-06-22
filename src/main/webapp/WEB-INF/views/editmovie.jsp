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
<c:set var="movie" scope="request" value="${requestScope.movie}" />
<title>Your's next cinema : Edit-Movie</title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<main class="main-content">
			<div class="container">
				<div class="row">
					<div class="center">
						<h1 class="section-title text-center">Edit Movie Details</h1>
						<form action="updatedetails" method="post">
							<table class="table table-borderless">

								<tbody>
									<tr>
										<div class="form-group">
											<td class="text-center"><label for="mid">Movie
													ID:</label> <input type="text" class="form-control" id="mid"
												name="mid" value="<c:out value="${movie.getImdbID()}" />"
												readonly="true"></td>
											<td class="text-center"><label for="name">Movie
													Name:</label> <input type="text" class="form-control" id="name"
												name="name" value="<c:out value="${movie.getTitle()}" /> "></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td class="text-center"><label for="genre">Movie
													genre:</label> <input type="text" class="form-control" id="genre"
												name="genre" value="<c:out value="${movie.getGenre()}" />"
												readonly="true"></td>
											<td class="text-center"><label for="language">Movie
													language:</label> <input type="text" class="form-control"
												id="language" name="language"
												value="<c:out value="${movie.getLanguage()}" />"></td>
										</div>
									</tr>
									<tr>
										<div class="form-group">
											<td class="text-center"><label for="price">Movie
													price:</label> <input type="text" class="form-control" id="price"
												name="price" value="<c:out value="${movie.getPrice()}" />"></td>
											<td class="text-center"><label for="time">Movie
													time:</label> <input type="text" class="form-control" id="time"
												name="time" value="<c:out value="${movie.getShowTime()}" />"></td>
										</div>
									</tr>
								</tbody>
							</table>
							<table class="table table-borderless">
								<tbody>
									<tr>
										<div class="form-group">
											<td class="text-center"><label for="plot">Movie
													plot:</label> <textarea class="form-control" id="plot" name="plot"
													rows="4"><c:out value="${movie.getPlot()}" /></textarea></td>
										</div>
									</tr>
									<input type="hidden" id="poster" name="poster"
										value="<c:out value="${movie.getPoster()}" />">
									<input type="hidden" id="status" name="status"
										value="<c:out value="${movie.getStatus()}" />">
									<tr>
										<div class="form-group">
											<td class=""><button type="submit"
													class="btn btn-primary">Update</button></td>
											<td class="text-end"><a href="admindashboard"
													class="button">Back</a></td>
										</div>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
			<!-- .container -->
		</main>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>