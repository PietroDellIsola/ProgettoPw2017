package orders.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import merce.db.Merchandise;
import merce.db.MerchandiseDAO;
import registrazione.db.DriverManagerConnectionPool;
import registrazione.db.UserData;

public class OrdersDAO implements OrdersDAOInterface{

	@Override
	public ArrayList<Orders> getOrdiniEffettuati(String username) throws SQLException {
		// TODO Auto-generated method stub
		
		ArrayList<Orders> ordini=new ArrayList<>();
		Connection connection = DriverManagerConnectionPool.getConnection();
		Connection connection2 = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp,statp2=null;
		ResultSet result,result2;
		String up,up2;
		
		
		up="SELECT * FROM orders WHERE orders.username=?";			  

		statp=connection.prepareStatement(up);
		statp.setString(1, username);
		
		try{
			result= statp.executeQuery();
				
			while(result.next()){
				Orders o=new Orders();
				o.setIdOrdine(result.getInt("IdOrdine"));
				o.setDataOrdine(result.getString("dataOrdine"));
				o.setUsername(result.getString("username"));
				up2="SELECT MERCHANDISE.* FROM merchandise INNER JOIN details ON "
						+ "details.id=merchandise.id WHERE details.IdOrdine=? ";
				statp2=connection2.prepareStatement(up2);
				statp2.setInt(1, o.getIdOrdine());
				result2= statp2.executeQuery();
				ArrayList<Merchandise> articoli=new ArrayList<>();
				while(result2.next()){
					Merchandise m=new Merchandise();
					m.setId(result2.getInt("id"));
					m.setNome(result2.getString("nome"));
					m.setTipo(result2.getString("tipo"));
					m.setDescrizione(result2.getString("descrizione"));
					m.setPrezzo(result2.getFloat("prezzo"));
					m.setUsername(result2.getString("username"));
					m.setFilename(result2.getString("filename"));
					m.setSconto(result2.getInt("sconto"));
					articoli.add(m);
				}
				o.setProdotti(articoli);
				ordini.add(o);
							}
			
			connection.commit();
			connection2.commit();
			} finally {
				try {
					if (statp != null&&statp2!=null){
						statp.close();
						statp2.close();
					}
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
					DriverManagerConnectionPool.releaseConnection(connection2);
				}
			}
		
		return ordini;
	}

	@Override
	public ArrayList<Orders> getOrdiniRicevuti(String username) throws SQLException {
		// TODO Auto-generated method stub
		
		ArrayList<Orders> ordini=new ArrayList<>();
		Connection connection = DriverManagerConnectionPool.getConnection();
		Connection connection2 = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp,statp2=null;
		ResultSet result,result2;
		String up,up2;
		
		
		up="SELECT * FROM orders ";			  

		statp=connection.prepareStatement(up);
		
		try{
			result= statp.executeQuery();
				
			while(result.next()){
				Orders o=new Orders();
				o.setIdOrdine(result.getInt("IdOrdine"));
				o.setDataOrdine(result.getString("dataOrdine"));
				o.setUsername(result.getString("username"));
				up2="SELECT MERCHANDISE.* FROM merchandise INNER JOIN details ON "
						+ "details.id=merchandise.id WHERE details.IdOrdine=? AND merchandise.username=? ";
				statp2=connection2.prepareStatement(up2);
				statp2.setInt(1, o.getIdOrdine());
				statp2.setString(2, username);
				result2= statp2.executeQuery();
				ArrayList<Merchandise> articoli=new ArrayList<>();
				while(result2.next()){
					Merchandise m=new Merchandise();
					m.setId(result2.getInt("id"));
					m.setNome(result2.getString("nome"));
					m.setTipo(result2.getString("tipo"));
					m.setDescrizione(result2.getString("descrizione"));
					m.setPrezzo(result2.getFloat("prezzo"));
					m.setUsername(result2.getString("username"));
					m.setFilename(result2.getString("filename"));
					m.setSconto(result2.getInt("sconto"));
					articoli.add(m);
				}
				o.setProdotti(articoli);
				ordini.add(o);
							}
			
			connection.commit();
			connection2.commit();
			} finally {
				try {
					if (statp != null&&statp2!=null){
						statp.close();
						statp2.close();
					}
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
					DriverManagerConnectionPool.releaseConnection(connection2);
				}
			}
		
		return ordini;
	}

	@Override
	public ArrayList<UserData> getUsers() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<UserData> clienti=new ArrayList<>();
		Connection connection = DriverManagerConnectionPool.getConnection();
		PreparedStatement statp;
		ResultSet result;
		String up;
		
		up="SELECT * FROM users WHERE tipo='cliente'";			  

		statp=connection.prepareStatement(up);
		
		try{
			result= statp.executeQuery();
				
			while(result.next()){
				UserData ud=new UserData();
				ud.setUsername(result.getString("username"));
				ud.setNome(result.getString("nome"));
				ud.setCognome(result.getString("cognome"));
				ud.setCellulare(result.getString("cellulare"));
				ud.setIndirizzo(result.getString("indirizzo"));
				ud.setCitta(result.getString("citta"));
				ud.setEmail(result.getString("email"));
				//ATTRIBUTI TIPO=CLIENTE E PASSWORD NON SONO NECESSARI
				clienti.add(ud);
				}
				
			
			connection.commit();
			} finally {
				try {
					if (statp != null){
						statp.close();
					}
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		
		return clienti;
	}

}
