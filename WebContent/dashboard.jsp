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
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
    }

    header {
        background-color: #ff69b4;
        color: white;
        padding: 10px 0;
    }

    menu {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
    }

    a {
        color: white;
        text-decoration: none;
        margin-left: 12px;
    }

    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    li {
        margin-right: 20px;
    }

    section {
        max-width: 1200px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ff69b4;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #ff69b4;
        color: white;
    }

    p {
        color: #ff69b4;
        text-align: center;
    }

    a img {
        width: 20px;
        height: 20px;
    }
</style>

</head>
<body>
	<header>
        <menu>
        <a style="margin-left: 12px;" href="./painelVendas.jsp">Início</a>
            <ul>
                <li><a href="./bolo/cadastroBolo.jsp">Cadastrar Bolo</a></li>
                <li><a href="venda/vendasAll.jsp">Todas as Vendas</a></li>
                <li><a target="_blank" href="https://api.whatsapp.com/send/?phone=%2B5591983102819&text&type=phone_number&app_absent=0">Fale Conosco</a></li>
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