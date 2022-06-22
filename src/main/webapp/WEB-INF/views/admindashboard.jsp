<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
@import
	url('https://fonts.googleapis.com/css?family=Josefin+Sans:100,300,400,600,700')
	;

.list-group-item-active {
	background: #bce0b8 !important;
	border-color: #bce0b8 !important;
}

body {
	background: #fff;
	font-family: 'Josefin Sans', sans-serif;
}

h3 {
	font-family: 'Josefin Sans', sans-serif;
}

.box {
	padding: 0px 0px;
}

.box-part {
	background: #F0FFFF;
	padding: 60px 10px;
	margin: 30px 0px;
	margin-bottom: 25px;
}

.box-part:hover {
	background: #000001;
	cursor: pointer;
}

.box-part:hover .fa, .box-part:hover .title, .box-part:hover .text,
	.box-part:hover a {
	color: #FFF;
	-webkit-transition: all 1s ease-out;
	-moz-transition: all 1s ease-out;
	-o-transition: all 1s ease-out;
	transition: all 1s ease-out;
}

.text {
	margin: 20px 0px;
}
</style>
<title>Your's next cinema : Admin Dashboard</title>
<%@include file="../resources/component/admin_css_js.jsp"%>
<%@include file="../resources/component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="../resources/component/navbar.jsp"%>

	<div class="container admin mt-3">
		<div class="page-header">
			<h1>Admin Dashboard</h1>
		</div>
		<div class="container-fluid">
			<%@include file="../resources/component/message.jsp"%>
		</div>
		<div class="box">
			<div class="container">
				<div class="row">

					<!-- first column -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="box-part text-center" data-toggle="modal"
							data-target="#add-remove-modal">
							<i class="fa-regular fa-square-plus fa-5x" aria-hidden="true"></i>
							<div class="text">
								<span>Add or remove different genres</span>
							</div>
						</div>
					</div>

					<!-- second column -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="box-part text-center" data-toggle="modal"
							data-target="#edit-movie-modal">
							<i class="fa-regular fa-pen-to-square fa-5x" aria-hidden="true"></i>
							<div class="text">
								<span>Edit movie Details</span>
							</div>
						</div>
					</div>

					<!-- third column -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="box-part text-center" data-toggle="modal"
							data-target="#enable-disable-modal">
							<i class="fa-regular fa-bell-slash fa-5x" aria-hidden="true"></i>
							<div class="text">
								<span>Enable or disable the movie</span>
							</div>
						</div>
					</div>
				</div>


				<div class="row">

					<!-- fourth column -->

					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="box-part text-center" data-toggle="modal"
							data-target="#update-db-modal">
							<i class="fa-regular fa-square-caret-up fa-5x" aria-hidden="true"></i>
							<div class="text">
								<span><a href="updateDB">Update Data Base</a></span>
							</div>
						</div>
					</div>


					<!-- end -->
				</div>
			</div>
		</div>

		<!-- modal for first -->

		<div class="modal fade" id="add-remove-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h3 class="modal-title text-center" id="exampleModalLabel"
							style="color: rgb(45, 45, 45)">Add or remove different
							genres Category</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="container">
							<div class="row">
								<div class="col-8">
									<table class="table table-borderless">
										<thead>
											<tr>
												<th scope="col">Movie</th>
												<th scope="col">Genres</th>
												<th scope="col">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="movie" items="${mstatus}">
												<tr>
													<td>${movie.getTitle()}</td>
													<td>${movie.getGenre()}</td>
													<td>
														<form action="removegenre">
															<input type="hidden" id="movieId" name="movieId"
																value="${movie.getImdbID()}">
															<button type="submit" class="btn btn-danger">
																<i class="fa-regular fa-trash-can fa-1x"></i>
															</button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<form action="addgenre">
							<div class="form-group">
								<select name="genre" id="genre">
									<c:forEach var="movie" items="${gtoadd}">
										<option value="${movie.getImdbID()}">${movie.getTitle()}
											: ${movie.getGenre()}</option>
									</c:forEach>
								</select>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Add
									Genres</button>
								<button type="submit" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- modal for second-->

		<div class="modal fade" id="edit-movie-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h3 class="modal-title text-center" id="exampleModalLabel"
							style="color: rgb(45, 45, 45)">Edit Movie Details</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="container" data-toggle="modal"
							data-target="#edit-movie2-modal">
							<div class="row">
								<div class="col-8">
									<table class="table table-borderless">

										<thead>
											<tr>
												<th scope="col">Movie Name</th>
												<th scope="col">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="movie" items="${mstatus}">
												<form action="editmovie">
												<tr>
													<input type="hidden" id="movieId" name="movieId"
														value="${movie.getImdbID()}">
													<td>${movie.getTitle()}</td>
													<td>
														<button type="submit" class="btn btn-warning">
															<i class="fa-regular fa-pen-to-square fa-1x"></i>
														</button>
													</td>
												</tr>
												</form>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- modal for third -->

		<div class="modal fade" id="enable-disable-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h3 class="modal-title text-center" id="exampleModalLabel"
							style="color: rgb(45, 45, 45)">Enable or Disable Movie</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="container">
							<div class="row">
								<div class="col-8">
									<table class="table table-borderless">
										<thead>
											<tr>
												<th scope="col">Movie Name</th>
												<th scope="col">Status</th>
												<th scope="col">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="movie" items="${mstatus}">
												<tr>
													<td>${movie.getTitle()}</td>
													<td>${movie.getStatus()}</td>
													<td>
														<form action="changestatus">
															<input type="hidden" id="movieId" name="movieId"
																value="${movie.getImdbID()}">
															<c:if test="${movie.getStatus().equals('enable')}">
																<button type="submit" class="btn btn-danger">
																	<i class="fa-regular fa-bell-slash fa-1x"></i>
																</button>
															</c:if>
															<c:if test="${movie.getStatus().equals('disable')}">
																<button type="submit" class="btn btn-success">
																	<i class="fa-regular fa-bell-slash fa-1x"> </i>
																</button>
															</c:if>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../resources/component/common_modal.jsp"%>
		<%@include file="../resources/component/footer.jsp"%>
</body>
</html>
