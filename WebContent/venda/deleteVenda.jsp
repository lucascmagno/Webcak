<%@page import="dao.VendaDao"%>
<%@page import="model.Venda"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Venda venda = new Venda();
venda.setIdVenda(Integer.parseInt(request.getParameter("idVenda")));

VendaDao vendaDao = new VendaDao();
ok = vendaDao.deleteVenda(venda);

if(ok){
%>
<script type="text/javascript">
	alert("Venda deletada com sucesso!");
	window.location.href="./vendasAll.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao deletar a venda");
	window.location.href="./vendasAll.jsp";
</script>
<%} %>
