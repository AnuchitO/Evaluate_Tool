package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.entity.Base;


@Repository
public class BaseDaoImpl extends AbstracHibernateDaoSupport implements BaseDao {
	private static final Logger logger = LoggerFactory.getLogger(BaseDaoImpl.class);

	@Override
	public List<Base> findAll() {
		return this.getHibernateTemplate().find("from Base");
	}

	@Override
	public void save(Base base) {		
		this.getHibernateTemplate().save(base);
	}

	@Override
	public Base findByName(String name) {
		 DetachedCriteria criteria = DetachedCriteria.forClass(Base.class);  
		 				  criteria.add(Restrictions.eq("name", name));
		 List<Base> result = this.getHibernateTemplate().findByCriteria(criteria);
		 Base base = new Base();
		 try {
			base = result.get(0);
		} catch (NullPointerException e) {
			
		}
			 
		return base;
	}

}