<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@page import="com.project.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
@import url("https://fonts.googleapis.com/css?family=Lato&display=swap")
	;

* {
	box-sizing: border-box;
}

body {
	background-color: #131a20;
	color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	font-family: "Lato", sans-serif;
	margin: 0;
}

.movie-container {
	margin: 20px 0;
}

.movie-container select {
	background-color: #fff;
	border: 0;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 10px;
	padding: 5px 15px 5px 15px;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
}

.container {
	perspective: 1000px;
	margin-bottom: 30px;
}

.seat {
	background-color: #444451;
	height: 12px;
	width: 15px;
	margin: 3px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.seat.selected {
	background-color: #6feaf6;
}

.seat.occupied {
	background-color: #fff;
}

.seat:nth-of-type(2) {
	margin-right: 18px;
}

.seat:nth-last-of-type(2) {
	margin-left: 18px;
}

.seat:not(.occupied):hover {
	cursor: pointer;
	transform: scale(1.2);
}

.showcase .seat:not(.occupied):hover {
	cursor: default;
	transform: scale(1);
}

.showcase {
	background: rgba(0, 0, 0, 0.1);
	padding: 5px 10px;
	border-radius: 5px;
	color: #777;
	list-style-type: none;
	display: flex;
	justify-content: space-between;
}

.showcase li {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 10px;
}

.showcase li small {
	margin-left: 2px;
}

.row {
	display: flex;
}

.screen {
	background-color: #fff;
	height: 70px;
	width: 100%;
	margin: 15px 0;
	transform: rotateX(-45deg);
	box-shadow: 0 3px 10px rgba(255, 255, 255, 0.7);
}

p.text {
	margin: 5px 0;
}

p.text span {
	color: #6feaf6;
}

.block {
	display: block;
	width: 100%;
	border: none;
	background-color: #cb3b3b;
	margin-top: 20px;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
}

.button {
	color: white;
	border-style: solid;
	border-width: 1px 1px 1px 1px;
	text-decoration: none;
	padding: 4px;
	border-color: #000000 background-color:green;
}
</style>
<c:set var="mshow" scope="request" value="${requestScope.mshow}" />
<title>Your's next cinema : Seat Confirmation</title>
</head>
<body>
	<%
	user u1 = (user) session.getAttribute("current-user");
	if (u1 == null) {
		com.project.entity.message m = new com.project.entity.message();
		m.setContent("Please Login To Continue Your Seat Booking !!! ");
		m.setType("danger");
		session.setAttribute("message",m);
		response.sendRedirect("home");
	}
	%>
	<div class="movie-container">
		<label>Movie : </label> <select id="movie">
			<option value="<c:out value="${mshow.getPrice()}" />"><c:out
					value="${mshow.getTitle()}" /> ( Price :
				<c:out value="${mshow.getPrice()}" /> Rs)
			</option>
		</select>
	</div>

	<ul class="showcase">
		<li>
			<div class="seat"></div> <small>N/A</small>
		</li>
		<li>
			<div class="seat selected"></div> <small>Selected</small>
		</li>
		<li>
			<div class="seat occupied"></div> <small>Occupied</small>
		</li>
	</ul>

	<div class="container">
		<div class="screen"></div>

		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat occupied"></div>
			<div class="seat occupied"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat occupied"></div>
			<div class="seat occupied"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat occupied"></div>
			<div class="seat occupied"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
		</div>
		<div class="row">
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat"></div>
			<div class="seat occupied"></div>
			<div class="seat occupied"></div>
			<div class="seat occupied"></div>
			<div class="seat"></div>
		</div>
	</div>

	<p class="text">
		You have selected <span id="count">0</span> seats for a price of Rs
		&nbsp; <span id="total">0</span> <a class="button"
			href="carddetails?userid=<%if (u1 != null) out.print(u1.getUserid());%>&movieId=<c:out value="${mshow.getImdbID()}" />">Pay
			Now</a>
	</p>
	<script>
	const container = document.querySelector(".container");
	const seats = document.querySelectorAll(".row .seat:not(.occupied)");
	const count = document.getElementById("count");
	const total = document.getElementById("total");
	const movieSelect = document.getElementById("movie");

	populateUI();

	let ticketPrice = +movieSelect.value;

	// Save selected movie index and price
	function setMovieData(movieIndex, moviePrice) {
	  localStorage.setItem("selectedMovieIndex", movieIndex);
	  localStorage.setItem("selectedMoviePrice", moviePrice);
	}

	// Update total and count
	function updateSelectedCount() {
	  const selectedSeats = document.querySelectorAll(".row .seat.selected");

	  const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

	  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

	  const selectedSeatsCount = selectedSeats.length;

	  count.innerText = selectedSeatsCount;
	  total.innerText = selectedSeatsCount * ticketPrice;

	  setMovieData(movieSelect.selectedIndex, movieSelect.value);
	}

	// Get data from localstorage and populate UI
	function populateUI() {
	  const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));

	  if (selectedSeats !== null && selectedSeats.length > 0) {
	    seats.forEach((seat, index) => {
	      if (selectedSeats.indexOf(index) > -1) {
	        seat.classList.add("selected");
	      }
	    });
	  }

	  const selectedMovieIndex = localStorage.getItem("selectedMovieIndex");

	  if (selectedMovieIndex !== null) {
	    movieSelect.selectedIndex = selectedMovieIndex;
	  }
	}

	// Movie select event
	movieSelect.addEventListener("change", (e) => {
	  ticketPrice = +e.target.value;
	  setMovieData(e.target.selectedIndex, e.target.value);
	  updateSelectedCount();
	});

	// Seat click event
	container.addEventListener("click", (e) => {
	  if (
	    e.target.classList.contains("seat") &&
	    !e.target.classList.contains("occupied")
	  ) {
	    e.target.classList.toggle("selected");

	    updateSelectedCount();
	  }
	});

	// Initial count and total set
	updateSelectedCount();

	</script>
</body>
</html>