import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.kosign.wecafe.util.HibernateUtil;

public class test {

	public static void main(String[] args) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("SELECT new Map(io.proQty as proQty ,product.productName as productName, ip.userId as userId )"
					+ "FROM ImportDetail io "
					+ "INNER JOIN io.pk1.product product "
					+ "INNER JOIN io.pk1.importProduct ip ");
			
			List<Map> products = (ArrayList<Map>)query.list();
			System.out.println("products.size()" + products.size());
			for(Map product : products){
				System.out.println("product.productName" + product.get("productName"));
				System.out.println("IP.userId" + product.get("proQty"));
				System.out.println("I.proQty" +  product.get("userId"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
	}

}
