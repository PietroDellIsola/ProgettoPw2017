package merce.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import profilo.db.ProfileDAO;
import registrazione.db.DriverManagerConnectionPool;

public class MerchandiseDAO implements MerchandiseDAOInterface{

	private static final String TABLE_NAME = "merchandise";
	
	@Override
	public void doSave(Merchandise merchandise) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + MerchandiseDAO.TABLE_NAME
				+ " (NOME, TIPO, DESCRIZIONE, PREZZO, USERNAME,FILENAME,SCONTO) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, merchandise.getNome());
			preparedStatement.setString(2, merchandise.getTipo());
			preparedStatement.setString(3, merchandise.getDescrizione());
			preparedStatement.setString(4, ""+merchandise.getPrezzo());
			preparedStatement.setString(5, merchandise.getUsername());
			preparedStatement.setString(6, merchandise.getFilename());
			preparedStatement.setString(7, ""+merchandise.getSconto());
			
			
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
	}

	@Override
	public ArrayList<Merchandise> getMerchandise(String username) throws SQLException {
		
		/*Ricerca i prodotti di un determinato venditore*/
		ArrayList<Merchandise> merce=new ArrayList<Merchandise>();
	
		Connection connection = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp;
		ResultSet result;
		String up;
		
		up="SELECT * FROM "+ MerchandiseDAO.TABLE_NAME+" WHERE username=?";			  

		statp=connection.prepareStatement(up);
		
		statp.setString(1, username);
		
		try{
			result= statp.executeQuery();
				
			while(result.next()){
				Merchandise m=new Merchandise();
				m.setId(result.getInt("id"));
				m.setNome(result.getString("nome"));
				m.setTipo(result.getString("tipo"));
				m.setDescrizione(result.getString("descrizione"));
				m.setPrezzo(result.getFloat("prezzo"));
				m.setFilename(result.getString("filename"));
				m.setSconto(result.getInt("sconto"));
				merce.add(m);
				
							}
			connection.commit();
			} finally {
				try {
					if (statp != null)
						statp.close();
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		
		
		return merce;
	
	}

	@Override
	public boolean deleteMerchandise(String username, String nomeMerce) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + MerchandiseDAO.TABLE_NAME + 
				" WHERE USERNAME=? AND NOME=? ";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, nomeMerce);

			result = preparedStatement.executeUpdate();
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}

	@Override
	public ArrayList<Merchandise> findMerchandise(String nome, String tipo, int sconto, float prezzoMin, float prezzoMax)
			throws SQLException {

		ArrayList<Merchandise> merce=new ArrayList<Merchandise>();
		
		/*Ricerca i prodotti per il cliente*/
		Connection connection = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp;
		ResultSet result;
		String up;
			
		if(tipo.equals("")&&(sconto==1))up="SELECT * FROM "+ MerchandiseDAO.TABLE_NAME+" WHERE "
				+ " sconto!=0 AND prezzo>? AND prezzo<?";
		
		else if (tipo.equals("")&&(sconto==0))up="SELECT * FROM "+ MerchandiseDAO.TABLE_NAME
				+ "  WHERE prezzo>? AND prezzo<?";
		
		else if(sconto==1)
		up="SELECT * FROM "+ MerchandiseDAO.TABLE_NAME+" WHERE  tipo=? AND "
				+ "sconto!=0 AND prezzo>? AND prezzo<?";			  

		else up="SELECT * FROM "+ MerchandiseDAO.TABLE_NAME+" WHERE  tipo=? AND "
				+ " prezzo>? AND prezzo<?";		
		
		statp=connection.prepareStatement(up);
		
		if(!(tipo.equals(""))){
			statp.setString(1, tipo);
			statp.setFloat(2, prezzoMin);
			statp.setFloat(3, prezzoMax);
							  }
		
		if(tipo.equals("")) {
			statp.setFloat(1, prezzoMin);
			statp.setFloat(2, prezzoMax);
			}
		
		try{
			result= statp.executeQuery();
				
			while(result.next()){
				if(result.getString("nome").toLowerCase().contains(nome.toLowerCase())){
				Merchandise m=new Merchandise();
				m.setId(result.getInt("id"));
				m.setNome(result.getString("nome"));
				m.setTipo(result.getString("tipo"));
				m.setDescrizione(result.getString("descrizione"));
				m.setPrezzo(result.getFloat("prezzo"));
				m.setFilename(result.getString("filename"));
				m.setSconto(result.getInt("sconto"));
				m.setUsername(result.getString("username"));
				merce.add(m);
															}
							}
			connection.commit();
			} finally {
				try {
					if (statp != null)
						statp.close();
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		
		
		return merce;
	}

	@Override
	public boolean modifyMerchandise(Merchandise merchandise,String nomeProdotto) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement=null;

		int result = 0;
		
		String SQL =""; 
		
		if(!(merchandise.getFilename().equals(""))){
			SQL= "UPDATE " + MerchandiseDAO.TABLE_NAME+" SET "
				+ " nome=?, tipo=?, descrizione=?, prezzo=?, "
				+ " sconto=?, filename=? WHERE username=? AND nome=?";
		}
		else{
			SQL= "UPDATE " + MerchandiseDAO.TABLE_NAME+" SET "
				+ " nome=?, tipo=?, descrizione=?, prezzo=?, "
				+ " sconto=? WHERE username=? AND nome=?";
		}
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setString(1, merchandise.getNome());
			preparedStatement.setString(2, merchandise.getTipo());
			preparedStatement.setString(3, merchandise.getDescrizione());
			preparedStatement.setString(4, ""+merchandise.getPrezzo());
			preparedStatement.setString(5, ""+merchandise.getSconto());
			
			if(!(merchandise.getFilename().equals(""))){
			preparedStatement.setString(6, merchandise.getFilename());
			preparedStatement.setString(7, merchandise.getUsername());
			preparedStatement.setString(8, nomeProdotto);}
			
			else{
			preparedStatement.setString(6, merchandise.getUsername());
			preparedStatement.setString(7, nomeProdotto);	
			}

			result = preparedStatement.executeUpdate();
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}

	@Override
	public Merchandise getMerchandiseName(String username, String MerchandiseName) throws SQLException {
		// TODO Auto-generated method stub
				
		Connection connection = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp;
		ResultSet result;
		String up;
		
		up="SELECT * FROM "+ MerchandiseDAO.TABLE_NAME+" WHERE username=? AND nome=?";			  

		statp=connection.prepareStatement(up);
		
		statp.setString(1, username);
		statp.setString(2, MerchandiseName);
		Merchandise m=null;
		try{
			result= statp.executeQuery();
				
			result.next();
			m=new Merchandise();
			m.setId(result.getInt("id"));
			m.setNome(result.getString("nome"));
			m.setTipo(result.getString("tipo"));
			m.setDescrizione(result.getString("descrizione"));
			m.setPrezzo(result.getFloat("prezzo"));
			m.setFilename("merchandiseImages"+'\\'+result.getString("filename"));
			m.setSconto(result.getInt("sconto"));
			connection.commit();
			} finally {
				try {
					if (statp != null)
						statp.close();
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		
		
		return m;
	
		
	}
	

		
}


