<%@page import="dao.BoloDao"%>
<%@page import="model.Bolo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Bolo bolo = new Bolo();
bolo.setNome(request.getParameter("nome"));
bolo.setPreco(Double.valueOf(request.getParameter("preco")).doubleValue());

BoloDao boloDao = new BoloDao();
ok = boloDao.inserirBolo(bolo);

if(ok){
%>
<script type="text/javascript">
	alert("Bolo cadastrado com sucesso!");
	window.location.href="../dashboard.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao cadastrar o bolo");
	window.location.href="./dashboard.jsp";
</script>
<%} %>
