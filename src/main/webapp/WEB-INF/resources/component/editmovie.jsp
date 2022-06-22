	<!-- modal for second part 2-->

	<div class="modal fade" id="edit-movie2-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h3 class="modal-title" id="exampleModalLabel"
						style="color: rgb(45, 45, 45)">Edit Movie Details</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="container">
						<div class="row">
							<div class="col-8">
								<form action="">
									<table class="table table-borderless">

										<tbody>
											<tr>
												<div class="form-group">
													<td class="text-center"><label for="id">Movie
															ID:</label> <input type="text" class="form-control" id="id"
														name="id" value="<c:out value="${movie.getImdbID()}" />" disabled></td>
													<td class="text-center"><label for="name">Movie
															Name:</label> <input type="text" class="form-control" id="name"
														name="name" value="${movie.getTitle()}"></td>
												</div>
											</tr>
											<tr>
												<div class="form-group">
													<td class="text-center"><label for="genre">Movie
															genre:</label> <input type="text" class="form-control" id="genre"
														name="genre" value="${movie.getGenre()}" disabled></td>
													<td class="text-center"><label for="language">Movie
															language:</label> <input type="text" class="form-control"
														id="language" name="language" value="${movie.getLanguage()}"></td>
												</div>
											</tr>
											<tr>
												<div class="form-group">
													<td class="text-center"><label for="price">Movie
															price:</label> <input type="text" class="form-control" id="price"
														name="price" value="${movie.getPrice()}"></td>
													<td class="text-center"><label for="time">Movie
															time:</label> <input type="text" class="form-control" id="time"
														name="time" value="${movie.getShowTime()}"></td>
												</div>
											</tr>
										</tbody>
									</table>
									<table class="table table-borderless">
										<tbody>
											<tr>
												<div class="form-group">
													<td class="text-center"><label for="plot">Movie
															plot:</label> <textarea class="form-control" id="plot"
															name="plot" value="${movie.getPlot()}" rows="7"></textarea></td>
												</div>
											</tr>
											<tr>
												<div class="form-group">
													<td class="text-center"><button type="submit"
															class="btn btn-primary">Edit</button></td>
												</div>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>