<%
com.project.entity.message m = new com.project.entity.message();
m.setContent("Your Data Base Was Updated Successfull !!! ");
m.setType("success");
session.setAttribute("message",m);
response.sendRedirect("admindashboard");%>