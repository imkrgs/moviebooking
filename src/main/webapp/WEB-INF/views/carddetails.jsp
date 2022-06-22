<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../resources/component/common_css_js.jsp"%>
<title>Your's next cinema : Pay Now</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,100'
	rel='stylesheet' type='text/css'>
<style>
/* Global */
* {
	box-sizing: border-box;
}


body {
	margin: 0;
	background-color: #e7e7e7;
	font-family: 'Roboto', sans-serif;
}

/* Credit Card */
.credit-card {
	width: 360px;
	height: 400px;
	margin: 60px auto 0;
	border: 1px solid #ddd;
	border-radius: 6px;
	background-color: #fff;
	box-shadow: 1px 2px 3px 0px rgba(0, 0, 0, 0.10);
}

.form-header {
	height: 60px;
	padding: 20px 30px 0;
	border-bottom: 1px solid #E1E8EE;
}

.form-body {
	height: 340px;
	padding: 30px 30px 20px;
}

/* Title */
.title {
	margin: 0;
	color: #5e6977;
	font-size: 18px;
}

/* Common */
.card-number, .cvv-input input, .month select, .paypal-btn, .proceed-btn,
	.year select {
	height: 42px;
}

.card-number, .cvv-input input, .month select, .year select {
	font-size: 14px;
	font-weight: 100;
	line-height: 14px;
}

.card-number, .cvv-details, .cvv-input input, .month select, .year select
	{
	color: #86939e;
	opacity: .7;
}

/* Card Number */
.card-number {
	width: 100%;
	margin-bottom: 20px;
	padding-left: 20px;
	border: 2px solid #e1e8ee;
	border-radius: 6px;
}

/* Date Field */
.month select, .year select {
	-moz-appearance: none;
	-webkit-appearance: none;
	width: 145px;
	margin-bottom: 20px;
	padding-left: 20px;
	border: 2px solid #e1e8ee;
	border-radius: 6px;
	background: no-repeat;
	background-position: 85% 50%;
}

.month select {
	float: left;
}

.year select {
	float: right;
}

/* Card Verification Field */
.cvv-input input {
	width: 145px;
	float: left;
	padding-left: 20px;
	border: 2px solid #e1e8ee;
	border-radius: 6px;
	background: #fff;
}

.cvv-details {
	float: right;
	margin-bottom: 20px;
	font-size: 12px;
	font-weight: 300;
	line-height: 16px;
}

.cvv-details p {
	margin-top: 6px;
}

/* Buttons Section */
.paypal-btn, .proceed-btn {
	cursor: pointer;
	width: 100%;
	border-color: transparent;
	border-radius: 6px;
	font-size: 16px;
}

.proceed-btn {
	margin-bottom: 10px;
	background: #7dc855;
}

.paypal-btn a, .proceed-btn a {
	text-decoration: none;
	cursor: pointer;
}

.proceed-btn a {
	color: #fff;
}

.paypal-btn a {
	color: rgba(242, 242, 242, 0.7);
}

.paypal-btn {
	padding-right: 95px;
	background: no-repeat 65% 56% #009cde;
}
</style>
<%@include file="../resources/component/common_css_js.jsp"%>
</head>
<c:set var="mshow" scope="request" value="${requestScope.mshow}" />
<body>
	<!-- navbar included  -->
	<%@include file="../resources/component/navbar.jsp"%>
	<form class="credit-card">
		<div class="form-header">
			<h4 class="title">Credit card detail</h4>
		</div>

		<div class="form-body">
			<!-- Card Number -->
			<input type="text" class="card-number" placeholder="Card Number">

			<!-- Date Field -->
			<div class="date-field">
				<div class="month">
					<select name="Month">
						<option value="january">January</option>
						<option value="february">February</option>
						<option value="march">March</option>
						<option value="april">April</option>
						<option value="may">May</option>
						<option value="june">June</option>
						<option value="july">July</option>
						<option value="august">August</option>
						<option value="september">September</option>
						<option value="october">October</option>
						<option value="november">November</option>
						<option value="december">December</option>
					</select>
				</div>
				<div class="year">
					<select name="Year">
						
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
						<option value="2016">2025</option>
						<option value="2017">2026</option>
						<option value="2018">2027</option>
						<option value="2019">2028</option>
						<option value="2020">2029</option>
						<option value="2021">2030</option>
					</select>
				</div>
			</div>

			<!-- Card Verification Field -->
			<div class="card-verification">
				<div class="cvv-input">
					<input type="text" placeholder="CVV">
				</div>
				<div class="cvv-details">
					<p>
						3 digits usually found <br> on the signature strip
					</p>
				</div>
			</div>

			<!-- Buttons -->
			<button type="button" class="proceed-btn">
				<a href="bookingstatus?movieId=<c:out value="${mshow.getImdbID()}" />">Proceed</a>
			</button>
		</div>
	</form>
	<!-- .container -->
<%@include file="../resources/component/footer.jsp"%>
</body>
</html>