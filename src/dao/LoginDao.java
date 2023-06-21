package dao;

import model.LoginCadastro;
//Conexao
import util.Conexao;
import java.sql.SQLException;
import java.sql.ResultSet;

public class LoginDao {
	public LoginCadastro login (String email, String senha) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet rs = con.executeQuery("Select email, senha FROM usuario Where email='"+email+"' AND senha='"+senha+"';");
			System.out.println("Sucesso no Login");
			if(rs.next()) {
				return new LoginCadastro(
					rs.getString("email"),
					rs.getString("senha")
				);
			}else {
				return null;
			}
		}catch(SQLException e){
			System.out.println("erro ao ler os dados da tabela");
			return null;
		}
	}
}
