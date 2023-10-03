<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="dao.BoloDao" %>
<%@ page import="model.Bolo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Bolos</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <style>
    
    /* Reset de estilos padrão do navegador */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Roboto', sans-serif;
    background-color: #fff;
    color: #ff69b4;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: auto;
}

header {
	width:100%;
    background-color: #ff69b4;
    color: #fff;
    padding: 10px 0;
    padding-left: 20px;
}

nav ul {
    list-style: none;
    padding: 0;
}

nav li {
    display: inline;
    margin: 0 10px;
}

nav a {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
}

nav a:hover {
    text-decoration: underline;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    margin-top: 150px;
}

.topo {
    background-color: #ff69b4;
    color: #fff;
    text-align: center;
    padding: 10px;
    margin-bottom: 20px;
}

h1 {
    font-weight: 100;
}

.caixa {
    display: flex;
    flex-direction: column;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}

input[type="text"],
input[type="number"] {
    padding: 10px;
    border: 1px solid #ff69b4;
    border-radius: 3px;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
}

.botao {
    text-align: center;
}

#botao {
    background-color: #ff69b4;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
}

#botao:hover {
    background-color: #ff4983;
}
    
    </style>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="../painelVendas.jsp">Início</a></li>
            <li><a href="../dashboard.jsp">Painel do administrador</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <div class="topo">
        <h1>EDITE UM BOLO</h1>
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
            <div class="form-group">
            	<input type="hidden" name="id" value="<%=bolo.getId() %>">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" required value="<%= bolo.getNome()%>">
            </div>
            <div class="form-group">
                <label for="preco">Preço</label>
                <input type="number" name="preco" min="0.00" step="0.01" id="preco" required value="<%=bolo.getPreco()%>">
            </div>
            <div class="botao">
                <input type="submit" value="Editar" id="botao">
            </div>
        </div>
    </form>
    <% } else { %>
    <p>O livro não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>
    </div>
</body>
</html>
