<%
com.project.entity.message m = new com.project.entity.message();
m.setContent("Your Login Was Successfull !!! ");
m.setType("success");
session.setAttribute("message",m);
response.sendRedirect("home");%>