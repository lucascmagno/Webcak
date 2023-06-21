package dao;

import util.Conexao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Bolo;

public class BoloDao {
	
	public List<Bolo> listarBolos() throws SQLException {
        Conexao con = null;
        
        List<Bolo> livros = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT * FROM bolo;");
            while (rs.next()) {
                Bolo bolo = new Bolo();
                bolo.setId(rs.getInt("idBolo"));
                bolo.setNome(rs.getString("nomeBolo"));
                bolo.setPreco(rs.getDouble("precoBolo"));
                livros.add(bolo);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return livros;
    }
    
    public Bolo getBoloById(int id) throws SQLException {
        Conexao con = null;
        Bolo bolo = null;
        
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT * FROM bolo WHERE idBolo=" + id);
            
            if (rs.next()) {
                bolo = new Bolo();
                bolo.setId(rs.getInt("idBolo"));
                bolo.setNome(rs.getString("nomeBolo"));
                bolo.setPreco(rs.getDouble("precoBolo"));
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }
        
		return bolo;
    }
	
	public boolean inserirBolo(Bolo b) {
		
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO bolo(nomeBolo, precoBolo) VALUES("
					+ "'" + b.getNome() + "','"
					+ b.getPreco() + "');");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
	public boolean updateBolo(Bolo b) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("UPDATE bolo SET nomeBolo='"+b.getNome()+"', precoBolo='"+b.getPreco()+"'"
	                + "WHERE idBolo="+b.getId()+";");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	public boolean deleteBolo(Bolo b) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM bolo WHERE idBolo="+b.getId());
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
}
