<%@page import="dao.LoginDao"%>
<%@page import="model.LoginCadastro"%>
<%@page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String email = request.getParameter("email");
String senha = request.getParameter("password");

LoginDao loginDao = new LoginDao();
LoginCadastro login = loginDao.login(email, senha);


%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    
    <%-- Cria uma instância do LoginDao --%>
    <%
       if (login != null) {
           response.sendRedirect("dashboard.jsp");
           %>
           <script>alert("Deu certo!!!")</script>
           
           <%
           
     } else {
           // Exibe uma mensagem de login inválido
    	%>
    		<script>alert("Deu Ruim parça!")</script>
    	<%
           response.sendRedirect("./login.html");
    } %>
</body>
</html>