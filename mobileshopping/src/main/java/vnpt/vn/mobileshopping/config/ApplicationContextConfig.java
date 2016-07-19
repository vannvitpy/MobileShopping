package vnpt.vn.mobileshopping.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import vnpt.vn.mobileshopping.dao.ContactDAO;
import vnpt.vn.mobileshopping.dao.ManufactureDAO;
import vnpt.vn.mobileshopping.dao.OrderDAO;
import vnpt.vn.mobileshopping.dao.ProductDAO;
import vnpt.vn.mobileshopping.dao.ProviderDAO;
import vnpt.vn.mobileshopping.dao.UserDAO;
import vnpt.vn.mobileshopping.dao.impl.ContactDAOImpl;
import vnpt.vn.mobileshopping.dao.impl.ManufactureDAOImpl;
import vnpt.vn.mobileshopping.dao.impl.OrderDAOImpl;
import vnpt.vn.mobileshopping.dao.impl.ProductDAOImpl;
import vnpt.vn.mobileshopping.dao.impl.ProviderDAOImpl;
import vnpt.vn.mobileshopping.dao.impl.UserDAOImpl;

@Configuration
@ComponentScan("vnpt.vn.mobileshopping.*")
@EnableTransactionManagement
// Load to Environment.
@PropertySource("classpath:ds-hibernate-cfg.properties")
public class ApplicationContextConfig {

	// Lưu trữ các giá thuộc tính load bởi @PropertySource.
	@Autowired
	private Environment env;

	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		// Load property in message/validator.properties
		rb.setBasenames(new String[] { "messages/validator" });
		
		System.out.println("## messageSource: ResourceBundleMessageSource bean created!");
		return rb;
	}

	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		
		System.out.println("## getViewResolver: InternalResourceViewResolver bean created!");
		return viewResolver;
	}

	// Cấu hình để Upload.
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();

		// Set Max Size...
		// commonsMultipartResolver.setMaxUploadSize(...);
		System.out.println("## multipartResolver: CommonsMultipartResolver bean created!");
		return commonsMultipartResolver;
	}

	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();

		// Xem: ds-hibernate-cfg.properties
		dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
		dataSource.setUrl(env.getProperty("ds.url"));
		dataSource.setUsername(env.getProperty("ds.username"));
		dataSource.setPassword(env.getProperty("ds.password"));

		System.out.println("## getDataSource: " + dataSource);

		return dataSource;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource)
			{
		try{
			Properties properties = new Properties();

			// Xem: ds-hibernate-cfg.properties
			properties.put("hibernate.dialect",
					env.getProperty("hibernate.dialect"));
			properties.put("hibernate.show_sql",
					env.getProperty("hibernate.show_sql"));
			properties.put("current_session_context_class",
					env.getProperty("current_session_context_class"));

			LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();

			// Package chứa các entity class.
			factoryBean.setPackagesToScan(new String[] { "vnpt.vn.mobileshopping.entity" });
			System.out.println("##--111");
			factoryBean.setDataSource(dataSource);
			System.out.println("##--222");
			factoryBean.setHibernateProperties(properties);
			factoryBean.afterPropertiesSet();
			System.out.println("##--333");
			//
			SessionFactory sf = factoryBean.getObject();
			System.out.println("## getSessionFactory: " + sf);
			return sf;
		}catch(Exception ex){
			System.out.println("## Exception: " + ex.getStackTrace());
		}
		
		return null;
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(
			SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(
				sessionFactory);

		System.out.println("## getTransactionManager: " + transactionManager);
		return transactionManager;
	}

	@Bean(name = "contactDAO")
	public ContactDAO getContactDAO() {
		return new ContactDAOImpl();
	}

	@Bean(name = "manufactureDAO")
	public ManufactureDAO getManufactureDAO() {
		return new ManufactureDAOImpl();
	}

	@Bean(name = "orderDAO")
	public OrderDAO getOrderDAO() {
		return new OrderDAOImpl();
	}

	@Bean(name = "productDAO")
	public ProductDAO getProductDAO() {
		return new ProductDAOImpl();
	}

	@Bean(name = "providerDAO")
	public ProviderDAO getAccountDAO() {
		return new ProviderDAOImpl();
	}

	@Bean(name = "userDAO")
	public UserDAO getApplicantDAO() {
		return new UserDAOImpl();
	}

}
