<%@page import="dao.VendaDao"%>
<%@page import="model.Venda"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todas as Vendas</title>
<style>
    body {
        background-color: #fff; /* Cor de fundo branca */
        font-family: Arial, sans-serif;
    }

    h1 {
        color: #ff69b4; /* Cor rosa para o título */
    }

    .hr {
        border-top: 2px solid #ff69b4; /* Linha horizontal rosa */
        margin: 20px 0;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid #ff69b4; /* Borda rosa para as células da tabela */
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #ff69b4; /* Fundo rosa para os cabeçalhos da tabela */
        color: white; /* Texto branco nos cabeçalhos */
    }

    .voltar {
        text-decoration: none;
        color: #ff69b4; /* Cor rosa para o link de voltar */
        margin-bottom: 20px;
        display: inline-block;
    }

    .voltar:hover {
        text-decoration: underline;
    }

    p {
        color: #ff69b4; /* Cor rosa para o texto de mensagem */
    }

    a img {
        width: 20px;
        height: 20px;
    }

</style>

</head>
<body>
	<span><a href="../painelVendas.jsp" class="voltar">Painel de Vendas</a> > </span>
	<span><a href="../dashboard.jsp" class="voltar">Painel do adiministrador</a></span>
    <h1>Todas as Vendas</h1>
    <div class="hr"></div>
    <% 
    // Cria uma instância do SelectDao
    VendaDao VendaDao = new VendaDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Venda> vendas = VendaDao.listarVendasAll();
        
        if (vendas!= null && !vendas.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Bolo</th>
                        <th>Preço</th>
                        <th>Data da Venda</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Venda venda : vendas) {
                    %>
                        <tr>
                            <td><%= venda.getIdVenda() %></td>
                            <td><%= venda.getUsuario() %></td>
                            <td><%= venda.getNomeBolo() %></td>
                            <td><%= venda.getPrecoBolo() %></td>
                            <td><%= venda.getDataVenda() %></td>
                            <td><a href="./deleteVenda.jsp?idVenda=<%= venda.getIdVenda() %>"><img alt="delete" src="../images/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há Nada na lista de favoritos.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de Favoritos.</p>
    <% 
        }
    %>
</body>
</html>