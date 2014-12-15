package com.spt.evt.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import com.spt.evt.dao.MemberRegisterDao;
import com.spt.evt.entity.MemberRegister;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Repository
public class MemberRegisterDaoImpl extends TemplateEntityManagerDao implements MemberRegisterDao {
	
	@Override
	@Transactional
	public void save(MemberRegister memberRegister) {
		this.getEntityManager().persist(memberRegister);
		
	}

	@Override
	@Transactional(readOnly = true)
	public List<MemberRegister> findAll() {
		Query query = this.getEntityManager().createQuery("FROM Person");
		return query.getResultList();
	}
}
