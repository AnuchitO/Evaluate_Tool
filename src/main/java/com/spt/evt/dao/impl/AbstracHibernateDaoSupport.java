package com.spt.evt.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;


public class AbstracHibernateDaoSupport extends HibernateDaoSupport {
	@Autowired
	public void setWiredSessionFactory(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}
}
