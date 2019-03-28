package orders.db;

import java.util.ArrayList;
import merce.db.*; 

public class Orders {
	
	public int getIdOrdine() {
		return idOrdine;
	}
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	public String getDataOrdine() {
		return dataOrdine;
	}
	public void setDataOrdine(String dataOrdine) {
		this.dataOrdine = dataOrdine;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public ArrayList<Merchandise> getProdotti() {
		return prodotti;
	}
	public void setProdotti(ArrayList<Merchandise> prodotti) {
		this.prodotti = prodotti;
	}
	private int idOrdine;
	private String dataOrdine;
	private String username;
	private ArrayList<Merchandise> prodotti;
}
