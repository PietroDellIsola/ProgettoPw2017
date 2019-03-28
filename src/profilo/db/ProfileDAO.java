package profilo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import registrazione.db.DriverManagerConnectionPool;
import registrazione.db.UserData;

public class ProfileDAO implements ProfileDAOInterface{

	private static final String TABLE_NAME = "users";

	@Override
	public boolean deleteUser(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;		
		
		String deleteSQL = "DELETE FROM  " + ProfileDAO.TABLE_NAME 
				+"  WHERE USERNAME=?  ";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);

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
	public boolean modifyUser(UserData user) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement=null;

		int result = 0;
		
		String SQL = "UPDATE " + ProfileDAO.TABLE_NAME+" SET "
				+ " nome=?, cognome=?, cellulare=?, indirizzo=?, citta=?, "
				+ " email=? WHERE username=? ";

		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setString(1, user.getNome());
			preparedStatement.setString(2, user.getCognome());
			preparedStatement.setString(3, user.getCellulare());
			preparedStatement.setString(4, user.getIndirizzo());
			preparedStatement.setString(5, user.getCitta());
			preparedStatement.setString(6, user.getEmail());
			preparedStatement.setString(7, user.getUsername());
			
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

	
}
