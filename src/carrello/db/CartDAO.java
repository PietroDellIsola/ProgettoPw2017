package carrello.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import merce.db.Merchandise;
import registrazione.db.DriverManagerConnectionPool;

public class CartDAO implements CartDAOInterface{

	private static final String TABLE_NAME = "orders";
	@Override
	
	public void doSave(Cart carrello, String username) throws SQLException {
		// TODO Auto-generated method stub
		
		/*INSERISCO L'ORDINE NEL DB*/
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String up = "INSERT INTO " + CartDAO.TABLE_NAME
				+ " (DATAORDINE, username) VALUES (?, ?)";
		ResultSet result;
		String data="";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(up);
			
			GregorianCalendar gc=new GregorianCalendar();
			data=gc.get(Calendar.YEAR)+"/"+(gc.get(Calendar.MONTH)+1)+"/"+
					gc.get(Calendar.DAY_OF_MONTH)+"-"+gc.get(Calendar.HOUR)+":"+
					gc.get(Calendar.MINUTE)+":"+gc.get(Calendar.SECOND);
			
			preparedStatement.setString(1,data);
			preparedStatement.setString(2,username);
			
			
			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		/*PRELEVO L'ID DELL'ORDINE DAL DB*/
		connection = null;
		preparedStatement = null;
		int idOrdine;
		up = "SELECT orders.IdOrdine FROM " + CartDAO.TABLE_NAME
				+ " WHERE dataordine=? AND username=? ";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(up);
			
		
			preparedStatement.setString(1,data);
			preparedStatement.setString(2,username);
			
			
			result=preparedStatement.executeQuery();

			result.next();
			idOrdine=result.getInt("idOrdine");
			
			/*
			while(result.next()){
				idOrdine=result.getInt("id");
			}*/
			
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		
		/*INSERISCO PER OGNI OGGETTO NEL CARRELLO UNA TUPLA NEL DB, FORMATA DA 
		 * ID ORDINE ED ID DEL PRODOTTO*/
		connection = null;
		preparedStatement = null;

		
		
		up = "INSERT INTO details (IdOrdine, id) VALUES (?, ?)";
		try {
			
			ArrayList<Merchandise> articoli=carrello.getMerchandise();
			for(Merchandise m: articoli){
				
				connection = DriverManagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(up);
			
				preparedStatement.setInt(1,idOrdine);
				preparedStatement.setInt(2,m.getId());//PER OGNI ARTICOLO

				preparedStatement.executeUpdate();
			
				connection.commit();
		
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		
		
	}

}
