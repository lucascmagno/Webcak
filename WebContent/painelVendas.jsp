<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="dao.BoloDao"%>
<%@page import="model.Bolo"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 20px;
  }

  .marca img {
      max-width: 100px;
  }

  .banner img.header-img {
      max-width: 100%;
      height: auto;
  }

  nav a {
      color: white;
      text-decoration: none;
      margin-left: 20px;
  }

  h2 {
      color: #ff69b4;
      text-align: center;
  }

  section {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      max-width: 1200px;
      margin: 20px auto;
  }

  .card {
      background-color: #fff;
      border: 1px solid #ff69b4;
      border-radius: 5px;
      margin: 10px;
      padding: 20px;
      text-align: center;
      width: 250px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  .titulo {
      color: #ff69b4;
      font-weight: bold;
      margin-bottom: 10px;
  }

  .preco {
      color: #ff69b4;
      font-size: 1.2em;
  }

  .favorito {
      margin-top: 20px;
  }

  .favorito img {
      width: 30px;
      height: 30px;
  }

  p {
      color: #ff69b4;
      text-align: center;
  }
</style>

</head>
<body>
    <header class="header">
        <div class="marca">
            <img src="./images/marca.svg" alt="">
        </div>
        <nav>
            <a href="#">Suas Compras</a>
            <a href="dashboard.jsp">Painel de Administrador</a>
        </nav>
    </header>
    <h2>Lista de Bolos</h2>
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
           <% 
           // Itera sobre a lista de livros e exibe cada um deles na tabela
           for (Bolo bolo : bolos) {
           %>
            <div class="card">
            <div class="content titulo"><%=bolo.getNome() %></div>
            <div class="content preco">R$ <%=bolo.getPreco() %></div>
            <div class="content favorito" title="Adicionar ao carrinho">
                <a href="./venda/respostaVenda.jsp?idBolo=<%=bolo.getId()%>">
                	<img alt="" src="./images/carrinho.svg">
        		</a>
        	</div>
        </div>
   <% 
           }
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