
<%
com.project.entity.message m = (com.project.entity.message) session.getAttribute("message");
System.out.print("message reached at message jsp:"+m);

if (m != null) {
%>
<div class="alert alert-<%=m.getType()%> fade show" role="alert">
  <strong><%=m.getContent()%> !</strong>
</div>
<%session.removeAttribute("message");}%>