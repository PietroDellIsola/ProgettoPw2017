package carrello.db;
import java.util.ArrayList;

import merce.db.Merchandise;

public class Cart {

	public ArrayList<Merchandise> getMerchandise() {
		return merchandise;
	}

	public void addMerchandise(Merchandise merc) {
		this.merchandise.add(merc);
	}
	
	public void deleteMerchandise(int id) {
		for(int i=0;i<merchandise.size();i++)
			if(merchandise.get(i).getId()==id)
				this.merchandise.remove(i);
	}

	private ArrayList<Merchandise> merchandise=new ArrayList<>();
}
