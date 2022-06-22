<%@page import="com.project.entity.*"%>
<%
user u = (user) session.getAttribute("current-user");
admin a = (admin) session.getAttribute("current-admin");
%>
<header class="site-header">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark">
			<a href="home" id="branding" class="navbar-brand"> <img
				src='<c:url value="/resources/images/logo.png"/>' alt=""
				class="logo"> your next <br> <small
				class="site-description">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cinema</small>
			</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbarCollapse"
				class="collapse navbar-collapse justify-content-end">
				<div class="navbar-nav ml-auto">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="home">Home</a>
						</li>
						<li class="nav-item active"><a class="nav-link"
							href="booking?userid=<%if (u != null)
	out.print(u.getUserid());%>">Booking</a>
						</li>
						<%
						if (a == null) {
						%>
						<li class="nav-item active"><a class="nav-link"
							href="adminlogin">Admin Login</a></li>
						<%
						} else {
						%>
						<div class="nav-item dropdown">
							<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle">Admin Services</a>
							<div class="dropdown-menu">
								<a href="adminlogin" class="dropdown-item">Admin DashBoard</a> 
								<a href="adminlogout" class="dropdown-item">Admin Logout</a>
							</div>
						</div>
						<%
						}
						%>
						<%
						if (u == null) {
						%>
						<li class="nav-item active"><a class="nav-link" href="login">LogIn</a></li>
						<%
						} else {
						%>
						<li class="nav-item active"><a class="nav-link" href="logout">Logout</a></li>
						<%
						}
						%>
					</ul>
				</div>
				<form class="navbar-form form-inline ml-auto" action="search">
					<div class="input-group search-box">
						<input type="text" class="form-control" placeholder=""
							name="movie-name" autocomplete="off" required="required" />
						<div class="input-group-append">
							<button type="submit">
								<span> <i class="fa fa-search"></i>
								</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</nav>
		<!-- .main-navigation -->
	</div>
</header>