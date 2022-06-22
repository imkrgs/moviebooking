
<%
com.project.entity.message m = new com.project.entity.message();
m.setContent("Your Have Successfully Logged Out !!! ");
m.setType("warning");
session.setAttribute("message",m);
response.sendRedirect("home");%>