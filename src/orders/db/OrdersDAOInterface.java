package orders.db;

import java.sql.SQLException;
import java.util.ArrayList;

import registrazione.db.UserData;

public interface OrdersDAOInterface {
	
	public ArrayList<Orders> getOrdiniEffettuati(String username)throws SQLException;

	public ArrayList<Orders> getOrdiniRicevuti(String username)throws SQLException;

	public ArrayList<UserData> getUsers()throws SQLException;
}
