package com.spt.evt.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.MemberRegisterDao;
import com.spt.evt.entity.Hotel;
import com.spt.evt.entity.MemberRegister;

@Repository
public class MemberRegisterDaoImpl implements MemberRegisterDao {
	
	private EntityManager em;
	
	@PersistenceContext
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}
	
	@Transactional
	public void save(MemberRegister memberRegister) {
		em.persist(memberRegister);
	}
	
//	@Autowired
//  private SessionFactory sessionFactory;

//  @Transactional
//  public void save(MemberRegister member) {
//      Session session = sessionFactory.getCurrentSession();
//      session.save(member);
//  }

//	public SessionFactory getSessionFactory() {
//		return sessionFactory;
//	}

//	public void setSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}

	public void save(String dataForm) {
		System.out.println("GGGGGGGGGGGGGGG");
//		 Session session = sessionFactory.getCurrentSession();
//		 session.save(dataForm);
		
	}

}
