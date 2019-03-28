package registrazione.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDataDAO implements UserDataDAOInterface {

	private static final String TABLE_NAME = "users";

	@Override
	public synchronized boolean doSave(UserData data) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UserDataDAO.TABLE_NAME
				+ " (username, NOME, COGNOME, CELLULARE, INDIRIZZO, CITTA, EMAIL, PASSWORD, TIPO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		boolean flag=false;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, data.getUsername());
			preparedStatement.setString(2, data.getNome());
			preparedStatement.setString(3, data.getCognome());
			preparedStatement.setString(4, data.getCellulare());
			preparedStatement.setString(5, data.getIndirizzo());
			preparedStatement.setString(6, data.getCitta());
			preparedStatement.setString(7, data.getEmail());
			preparedStatement.setString(8, data.getPassword());
			preparedStatement.setString(9, data.getTipo());
			
			if(preparedStatement.executeUpdate()>0)flag=true;

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return flag;
	}
	
	public boolean getUsername(String username)throws SQLException {
				
		Connection connection = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp;
		ResultSet result;
		String up;
		
		up="SELECT username FROM "+ UserDataDAO.TABLE_NAME+" WHERE username=?";			  

		statp=connection.prepareStatement(up);
		
		statp.setString(1, username);
		
		try{
			result= statp.executeQuery();
				
			while(result.next()){
				return true;
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
		
		
		return false;
		
	}

}