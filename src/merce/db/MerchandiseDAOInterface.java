package merce.db;

import java.sql.SQLException;
import java.util.ArrayList;

import registrazione.db.UserData;

public interface MerchandiseDAOInterface {
	
	public void doSave(Merchandise merchandise) throws SQLException;
	
	public ArrayList<Merchandise> getMerchandise(String username) throws SQLException;

	public boolean deleteMerchandise(String username,String nomeMerce) throws SQLException; 
	
	public ArrayList<Merchandise> findMerchandise(String nome, String tipo, int sconto,
			float prezzoMin, float prezzoMax ) throws SQLException;
	
	public boolean modifyMerchandise(Merchandise merchandise,String nomeProdotto)throws SQLException; 
	
	public Merchandise getMerchandiseName(String username,String MerchandiseName)throws SQLException;
}
