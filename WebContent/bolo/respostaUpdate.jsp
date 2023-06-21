<%@page import="dao.BoloDao"%>
<%@page import="model.Bolo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Bolo bolo = new Bolo();
bolo.setId(Integer.parseInt(request.getParameter("id")));
bolo.setNome(request.getParameter("nome"));
String precoStr = request.getParameter("preco");
if (precoStr != null && !precoStr.isEmpty() && precoStr.matches("\\d+(\\.\\d+)?")) {
    double preco = Double.parseDouble(precoStr);
    bolo.setPreco(preco);
} else {
	double preco = Double.parseDouble("0.00");
    bolo.setPreco(preco);
}

BoloDao boloDao = new BoloDao();
ok = boloDao.updateBolo(bolo);

if(ok){
%>
<script type="text/javascript">
	alert("Bolo atualizado com sucesso!");
	window.location.href="../dashboard.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao atualizar os dados do bolo");
	window.location.href="../dashboard.jsp";
</script>
<%} %>
