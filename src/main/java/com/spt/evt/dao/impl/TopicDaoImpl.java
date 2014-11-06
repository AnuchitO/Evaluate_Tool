package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.TopicDao;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

@Repository
public class TopicDaoImpl extends TemplateHibernateDaoSupport implements
		TopicDao {
	private static final Logger logger = LoggerFactory.getLogger(TopicDaoImpl.class);

	@Override
	public Topic findById(Long id) {
		return (Topic) this.getHibernateTemplate().get(Topic.class, id);
	}

	@Override
	public List<Topic> findBySubject(Subject subject) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Topic.class);
		criteria.add(Restrictions.eq("subject", subject));
		criteria.addOrder(Order.asc("id"));
		List<Topic> result = (List<Topic>) this.getHibernateTemplate().findByCriteria(criteria);
		
		return result;
	}


}