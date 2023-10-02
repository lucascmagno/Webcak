package dao;

import java.sql.ResultSet;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Venda;
import util.Conexao;

public class VendaDao {
	public boolean inserirVenda(Venda v) {
		
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO venda (idVenda, idusuario, idbolo, data_venda)"
					+ " VALUES (null, "
					+ ""+v.getIdUsuario()+", "
					+ ""+v.getIdBolo()+",  NOW());");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
	public int getIdUsuario(String usuario) {
	    Conexao con = null;

	    try {
	        con = new Conexao();
	        String query = "SELECT idusuario FROM usuario WHERE nome = '" + usuario + "'";
	        
	        ResultSet resultSet = con.executeQuery(query);
	        
	        if (resultSet.next()) {
	            // Se encontrar o usuário, obtenha o ID do resultado
	            int idUsuario = resultSet.getInt("idusuario");
	            return idUsuario;
	        } else {
	            return 0; // Retorna 0 para indicar que o usuário não foi encontrado
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (con != null) {
	            con.fecharConexao();
	        }
	    }
	}
	
	public List<Venda> listarVendasAll() throws SQLException {
        Conexao con = null;
        
        List<Venda> vendasAll = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT v.idVenda as id, u.nome, b.nomeBolo AS bolo, b.precoBolo, v.data_venda as data\r\n"
            		+ "FROM usuario u\r\n"
            		+ "INNER JOIN venda v ON u.idusuario = v.idusuario\r\n"
            		+ "INNER JOIN bolo b ON v.idbolo = b.idBolo\r\n"
            		+ "ORDER BY v.idVenda;");
            
            while (rs.next()) {
                Venda vendaAll = new Venda();
                vendaAll.setIdVenda(rs.getInt("id"));
                vendaAll.setUsuario(rs.getString("nome"));
                vendaAll.setNomeBolo(rs.getString("bolo"));
                vendaAll.setPrecoBolo(rs.getDouble("precoBolo"));
                vendaAll.setDataVenda(rs.getString("data"));
                vendasAll.add(vendaAll);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return vendasAll;
    }
	
	public boolean deleteVenda(Venda venda) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM venda WHERE idVenda="+venda.getIdVenda());
			return true;
		}catch(SQLException e){
			return false;
		}
	}
}
