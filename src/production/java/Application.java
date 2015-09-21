import java.math.BigDecimal;
import java.util.Properties;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.util.HibernateUtil;

public class Application {

	/*public static void main(String[] args) {
		
		 Configuration 
		Configuration configuration = new Configuration();
		
		//configuration.addAnnotatedClass(Product.class);
		
		configuration.setProperties(new Properties(){
			{
				put("hibernate.connection.username","postgres");
				put("hibernate.connection.password","postgres");
				put("hibernate.connection.driver_class","org.postgresql.Driver");
				put("hibernate.connection.url","jdbc:postgresql://192.168.178.72:5432/WeCafe");
			}
			
		});
		
		 Building SessionFactory 
		SessionFactory sessionFactory = configuration
				.buildSessionFactory(new StandardServiceRegistryBuilder(
						).applySettings(configuration.getProperties()).build());
		
		 Obtain Session and call Persistence Methods 
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Product product = new Product();
		product.setProductName("Pepsi NEW");
		product.setQuantity(10L);
		product.setUnitPrice(new BigDecimal(1500));
		product.setCostPrice(new BigDecimal(1300));
		product.setSalePrice(new BigDecimal(1500));
		product.setCategoryId(1L);
		product.setImage("");		
		
		session.save(product);
		session.getTransaction().commit();
		session.close();
	}*/
	
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.close();
	}
}
