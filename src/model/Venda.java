package model;

public class Venda {
	private int idVenda;
	private int idUsuario;
	private int idBolo;
	private String dataVenda;
	private String usuario;
	private String nomeBolo;
	private double precoBolo;
	
	public Venda () {
		
	}
	
	public int getIdVenda() {
		return idVenda;
	}
	public void setIdVenda(int idVenda) {
		this.idVenda = idVenda;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdBolo() {
		return idBolo;
	}
	public void setIdBolo(int idBolo) {
		this.idBolo = idBolo;
	}
	public String getDataVenda() {
		return dataVenda;
	}
	public void setDataVenda(String dataVenda) {
		this.dataVenda = dataVenda;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getNomeBolo() {
		return nomeBolo;
	}

	public void setNomeBolo(String nomeBolo) {
		this.nomeBolo = nomeBolo;
	}

	public double getPrecoBolo() {
		return precoBolo;
	}

	public void setPrecoBolo(double precoBolo) {
		this.precoBolo = precoBolo;
	}
	
	
}
