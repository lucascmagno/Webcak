<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="dao.BoloDao" %>
<%@ page import="model.Bolo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Editar Livro</title>
    <link rel="stylesheet" href="../../css/cad.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<style>
	body{
		background-color: #FEEADF;
	}
	form{
		margin: auto;
	}
	h1{
		text-align: center;
	}
	.caixa{
		display: flex;
		align-item: center;
		justify-content: center;
		flex-direction: column;
		width: 400px;
		margin: auto;
	}
	.botao{
		display: flex;
		justify-content: center;
	}
	input{
		padding: 10px 60px;
		border-radius: 30px;}
	input[type="submit"]{
		padding: 10px 60px;
		border-radius: 30px;
		border: none;
		background-color: #E0B8A2;
		color: white;
	}
	
	input[type="submit"]:hover{
		cursor: pointer;
	}
</style>

</head>
<body>
<div class="topo">
        <h1>Edite Um Bolo</h1>
    </div>
    <%
    // Obter o ID do livro a ser editado a partir dos parâmetros da requisição
    int boloId = Integer.parseInt(request.getParameter("id"));
    
    // Criar uma instância do DAO
    BoloDao boloDao = new BoloDao();
    
    try {
        // Obter o livro com base no ID fornecido
        Bolo bolo = boloDao.getBoloById(boloId);
        
        if (bolo != null) {
    %>
    <form action="respostaUpdate.jsp" method="POST">
        <div class="caixa">
        <input name="id" type="hidden" value="<%= bolo.getId() %>">
            <p>Nome do Bolo </p> <input type="text" name="nome" id="titulo" value="<%= bolo.getNome() %>" required><br>
            <p> Preço do Bolo </p> <input type="number" name="preco" min="0.00" id="preco" value="<%= bolo.getPreco() %>" required><br>
        <div class="botao">
        <input type="submit" value="Adicionar" id="botao">
        </div>
        </div>
    </form>
    <a href="../dashboard.jsp" id="voltar">Voltar</a>
    <% } else { %>
    <p>O livro não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>
</body>
</html>
