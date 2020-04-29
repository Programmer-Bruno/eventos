package com.qintess.eventos.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.qintess.eventos.modelo.CasaDeShow;

import javax.persistence.criteria.CriteriaQuery;

@Repository
@EnableTransactionManagement
public class DAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public <T> void insere(T classe) {

			Session session = this.sessionFactory.getCurrentSession();
			session.save(classe);

	}

	@Transactional
	public <T> void atualiza(T classe) {
		
		Session session = this.sessionFactory.getCurrentSession();
		session.merge(classe);
	}
	
	
	
	@Transactional
	public <T> void remove(T classe) {
		Session session = this.sessionFactory.getCurrentSession();
		session.remove(classe);
	}
	
	@Transactional
	public <T> T buscaPorID(Class<T> classe, long id) {
		
		Session session = this.sessionFactory.getCurrentSession();
		
		return session.get(classe, id);
	}
	
//	@SuppressWarnings("unchecked")
//	@Transactional
////	public <T> List<T> buscaPorNome(Class<T> classe, String nome) {
////		Session session = this.sessionFactory.getCurrentSession();
////		@SuppressWarnings("deprecation")
////		Criteria c = session.createCriteria(classe);
////		c.add(Restrictions.ilike("nome", nome));
////		c.addOrder(Order.asc("nome"));
////		c.setProjection(Projections.property("nome"));
////
////		return session.createCriteria(persistentClass)c.list();
////	}

	@SuppressWarnings("unchecked")
	@Transactional
	public <T> List<T> buscaTodos(Class<T> classe) {
		
		Session session = this.sessionFactory.getCurrentSession();
		
		return session.createQuery("from " + classe.getName()).getResultList();
	}
}
