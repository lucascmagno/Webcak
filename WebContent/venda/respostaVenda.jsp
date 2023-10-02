<%@page import="dao.VendaDao"%>
<%@page import="model.Venda"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
// Cria uma instância do VendasDao
VendaDao vendaDao = new VendaDao();
Venda venda = new Venda();
HttpSession sessao = request.getSession(false); // Use false para não criar uma nova sessão, caso não exista

boolean ok = false;
int idBolo = Integer.parseInt(request.getParameter("idBolo"));
if (sessao != null) {
    String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");

    if (nomeUsuario != null) {
        try {
            // Chame o método para obter a lista de favoritos
            venda.setUsuario(nomeUsuario);
            venda.setIdBolo(idBolo);
            int idUsuario  = vendaDao.getIdUsuario(nomeUsuario);
            if(idUsuario > 0){
                venda.setIdUsuario(idUsuario);
            }
            ok = vendaDao.inserirVenda(venda);
            if(ok){
            %>
            	<script>
            		alert("Compra realizada com sucesso");
            		window.location.href = "../painelVendas.jsp";
            	</script>
            <%
            }else{
            %>
            	<script>
            		alert("Erro ao realizar a compra");
            		window.location.href = "../painelVendas.jsp";
            	</script>
            <%
            }
        } catch (Exception e) {
            // Exiba uma mensagem de erro caso ocorra um problema ao comprar o livro
    %>
    <p style="color: #fff;">Ocorreu um erro ao comprar o livro.</p>
    <%
        }
    } else {
        // O atributo "nomeUsuario" não está na sessão
    %>
    <script type="text/javascript">
        alert("Realize login para realizar a compra");
        window.location.href = "../Login.html";
    </script>
    <%
    } // Fim do if (nomeUsuario != null)
} else {
    // Não há sessão existente
%>
<script type="text/javascript">
    alert("Faça login para realizar a compra");
    window.location.href = "../Login.html";
</script>
<%
}
%>
</body>
</html>
