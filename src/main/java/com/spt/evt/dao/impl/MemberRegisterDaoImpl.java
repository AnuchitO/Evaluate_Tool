package com.spt.evt.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.MemberRegisterDao;
import com.spt.evt.entity.MemberRegister;

@Repository
public class MemberRegisterDaoImpl extends AbstracHibernateDaoSupport implements MemberRegisterDao {

	@Override
	public void save(MemberRegister memberRegister) {
		this.getHibernateTemplate().save(memberRegister);
		
	}

	@Override
	public List<MemberRegister> findAll() {
		return null;//this.getHibernateTemplate().find("from MemberRegister");
	}

}
