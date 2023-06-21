<%@page import="dao.CadastroDao"%>
<%@page import="model.LoginCadastro"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

LoginCadastro cadastro = new LoginCadastro();

cadastro.setNome(request.getParameter("firstname"));
cadastro.setSobrenome(request.getParameter("lastname"));
cadastro.setEmail(request.getParameter("email"));
cadastro.setTelefone(request.getParameter("telefone"));
cadastro.setSenha(request.getParameter("password"));

CadastroDao cadastroDao = new CadastroDao();
ok = cadastroDao.inserirUsuario(cadastro);

if(ok){
%> 
<script type="text/javascript">
	alert("Usuário cadastrado com sucesso!");
	window.location.href="./Login.html";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Usuário Já existente");
	window.location.href="../index.html";
</script>
<%} %>
