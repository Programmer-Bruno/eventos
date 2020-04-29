package com.qintess.eventos.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement 
public class HibernateConfig {
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan("com.qintess.eventos.modelo");
		sessionFactory.setHibernateProperties(hibernateProperties());
		
		return sessionFactory;
	}
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:~/db_eventos");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		
		return dataSource;
	}
	@Bean
	public HibernateTransactionManager getHibernateTransactionManager() {
		HibernateTransactionManager transactionHibernate = new HibernateTransactionManager();
		transactionHibernate.setSessionFactory(sessionFactory().getObject());
		
		return transactionHibernate;
	}
	
	private final Properties hibernateProperties() {
		Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		hibernateProperties.setProperty("hibernate.show_sql", "true");
		hibernateProperties.setProperty("hibernate.jdbc.time_zone", "UTC");
		hibernateProperties.setProperty("hibernate.connection.CharSet", "utf8");
		hibernateProperties.setProperty("hibernate.connection.characterEncoding", "true");
		hibernateProperties.setProperty("hibernate.connection.useUnicode", "true");
		
		return hibernateProperties;
	}
}
