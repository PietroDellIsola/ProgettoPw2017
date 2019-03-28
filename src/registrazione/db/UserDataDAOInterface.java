package registrazione.db;

import java.sql.SQLException;

public interface UserDataDAOInterface {
	public boolean doSave(UserData data) throws SQLException;

}