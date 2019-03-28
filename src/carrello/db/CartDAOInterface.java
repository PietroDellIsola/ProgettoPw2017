package carrello.db;

import java.sql.SQLException;

public interface CartDAOInterface {

	public void doSave(Cart carrello, String user)throws SQLException;

}
