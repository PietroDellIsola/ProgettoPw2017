package profilo.db;

import java.sql.SQLException;

import registrazione.db.UserData;

public interface ProfileDAOInterface {
	
	public boolean deleteUser(String username)throws SQLException; 
	
	public boolean modifyUser(UserData user)throws SQLException; 
}
