<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="../resources/component/common_css_js.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div id="site-content">
		<!-- navbar included  -->
		<%@include file="../resources/component/navbar.jsp"%>
		<main class="main-content">
			<div class="container">
				<div class="page">

					<div class="entry-content">
						<div class="row">
							<h2 class="section-title">&nbsp;&nbsp;Search Result's:</h2>
							<center>
								<h2 class="section-title"
									style="padding-top: 60px; padding-bottom: 60px">&nbsp;&nbsp;No
									Result Found !</h2>
							</center>

						</div>
					</div>
				</div>
			</div>

		</main>
		<%@include file="../resources/component/footer.jsp"%>
	</div>
</body>
</html>