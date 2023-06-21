<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        <h1>CADASTRE UM BOLO</h1>
    </div>
    <form action="resposta_cadastro.jsp" method="POST">
        <div class="caixa">
            <p>Nome </p> <input type="text" name="nome" id="titulo" required><br>
            <p> Preço </p> <input type="number" name="preco" min="0.00" id="preco" required><br>
        <div class="botao">
        <input type="submit" value="Adicionar" id="botao">
        </div>
        </div>
    </form>
</body>
</html>
