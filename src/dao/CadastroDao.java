package dao;

import util.Conexao;

import java.sql.SQLException;

import model.LoginCadastro;

public class CadastroDao {

	public boolean inserirUsuario(LoginCadastro c) {
		
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO `wevcake`.`usuario` (`nome`, `sobrenome`, `email`, `telefone`, `senha`) "
					+ "VALUES ('"+ c.getNome() +"',"
							+ "'"+c.getSobrenome()+"',"
							+ "'"+c.getEmail()+"', "
							+ "'"+c.getTelefone()+"',"
							+ "'"+c.getSenha()+"');");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
}
