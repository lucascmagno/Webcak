<%@page import="dao.BoloDao"%>
<%@page import="model.Bolo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Bolo bolo = new Bolo();
bolo.setId(Integer.parseInt(request.getParameter("id")));

BoloDao livroDao = new BoloDao();
ok = livroDao.deleteBolo(bolo);

if(ok){
%>
<script type="text/javascript">
	alert("Bolo apagado com sucesso!");
	window.location.href="../dashboard.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao apagar o Bolo");
	window.location.href="../dashboard.jsp";
</script>
<%} %>
