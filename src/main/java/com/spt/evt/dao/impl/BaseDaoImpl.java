package com.spt.evt.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.spt.evt.controller.HotelSearchController;
import com.spt.evt.dao.BaseDao;
import com.spt.evt.dao.BookingDao;
import com.spt.evt.dto.SearchCriteria;
import com.spt.evt.entity.Base;
import com.spt.evt.entity.Booking;
import com.spt.evt.entity.Hotel;
import com.spt.evt.entity.User;
import com.spt.evt.service.BookingService;

/**
 * A JPA-based implementation of the Booking Service. Delegates to a JPA entity
 * manager to issue data access calls against the backing repository. The
 * EntityManager reference is provided by the managing container (Spring)
 * automatically.
 */

@Repository
public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao {
	private static final Logger logger = LoggerFactory.getLogger(BaseDaoImpl.class);

	@Autowired
	public void setWiredSessionFactory(SessionFactory sessionFactory) {
		setSessionFactory(sessionFactory);
	}

	@Override
	public List<Base> findAll() {
		return this.getHibernateTemplate().find("from Base");
	}

	@Override
	public void save(Base base) {		
		this.getHibernateTemplate().save(base);
	}

}