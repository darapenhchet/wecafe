
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.OrderDetail;
import com.kosign.wecafe.util.HibernateUtil;

public class AppSelectOrder {

	public static void main(String[] args) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
	
		try {
			session.getTransaction().begin();
//			Order A = new Order();
//			OrderDetail B = new OrderDetail();
//			Map<Object,String> col = new HashMap<>();
//			col.put(A,"A");
//			col.put(B,"B");
			Query query = session.createQuery("select * FROM wecafe_order A INNER JOIN order_detail B where A.order_id = B.order_id");
			List<Order> orders = (ArrayList<Order>)query.list();
			System.out.println(orders.size());
			for(Order order : orders){
				System.out.println(order.getOrderDetail().iterator().next().getProduct().getProductName());
			}
		/*	
			while(orderDetails.iterator().hasNext()){
				System.out.println(orderDetails.iterator().next().getProduct().getProductName());
			}*/
			
			session.getTransaction().commit();
		} catch (Exception e) {
			e.getStackTrace();
			session.getTransaction().rollback();
		}
		finally {
			session.close();
		}
	}
}
