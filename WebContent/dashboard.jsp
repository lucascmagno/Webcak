<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="dao.BoloDao"%>
<%@page import="model.Bolo"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@charset "utf-8";

@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;1,100&display=swap');

:root{
    --rosa: #FEEADF;
}

*{
    margin: 0;
    padding: 0;
}

body{
    font-family: 'Poppins', sans-serif;
}
header{
    position: fixed;
    display: flex;
    width: 100%;
    background-color: var(--rosa);
    height: 90px;
}
menu{
    position: sticky;
    width: 100%;
    display: flex;
    align-items: center;
}
ul{
    width: 100%;
    list-style-type: none;
    display: flex;
    justify-content: space-around;
}
li{
    font-size: 1.8em;
    color: #000000;
}
li > a{
    text-decoration: none;
    color: #000000;
}
li > a:hover{
    color: #d6c9c3
}

table{
    margin: auto;
    border-collapse: collapse;
    width: 70vw;
    border-radius: 30px;
}
th,tr,td{
    text-align: center;
    padding: 10px;
    background-color: #feeadf3b;
    border-radius: 30px;
}
th:hover, tr:hover, td:hover{
	background-color: #FEEADF;
	cursor: pointer;
}

thead{
    background-color: #FEEADF;
}

section{
    padding-top: 140px;
}
td> a > img{
	width: 30px;
	height: 30px;
}
</style>
</head>
<body>
	<header>
        <menu>
            <ul>
                <li><a href="./bolo/cadastroBolo.jsp">Cadastrar Bolo</a></li>
                <li><a href="#">Cardapio</a></li>
                <li><a href="#">Fale Conosco</a></li>
            </ul>
        </menu>
    </header>
	
    <section>
    
    <% 
    // Cria uma instância do SelectDao
    BoloDao boloDao = new BoloDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Bolo> bolos = boloDao.listarBolos();
        
        if (bolos != null && !bolos.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome do Bolo</th>
                        <th>Preço</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Bolo bolo : bolos) {
                    %>
                        <tr>
                            <td><%= bolo.getId() %></td>
                            <td><%= bolo.getNome() %></td>
                            <td><%= bolo.getPreco() %></td>
                           	<td><a href="./bolo/updateBolo.jsp?id=<%= bolo.getId() %>"><img alt="edit" src="./images/edit.svg"></a></td>
                            <td><a href="./bolo/deleteBolo.jsp?id=<%= bolo.getId() %>"><img alt="delete" src="./images/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há Bolos cadastrados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de Bolos.</p>
    <% 
        }
    %>
    </section>

</body>
</html>