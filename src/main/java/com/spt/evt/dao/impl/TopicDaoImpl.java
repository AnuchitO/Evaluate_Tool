package com.spt.evt.dao.impl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Session;
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
import javax.persistence.EntityManager;
import com.spt.evt.dao.impl.TemplateEntityManagerDao;

@Repository
public class TopicDaoImpl extends TemplateEntityManagerDao implements
		TopicDao {
	private static final Logger logger = LoggerFactory.getLogger(TopicDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public Topic findById(Long id) {
		return this.getEntityManager().find(Topic.class, id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Topic> findBySubject(Subject subject) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Topic.class);
		criteria.add(Restrictions.eq("subject", subject));
		criteria.addOrder(Order.asc("id"));
		List<Topic> result = criteria.list();
		
		return result;
	}

	@Override
	@Transactional
	public void persist(Topic topic){
		this.getEntityManager().persist(topic);
	}

	@Override
	@Transactional
	public void removeTopic(Topic topic){
		this.getEntityManager().remove(topic);
	}

	@Override
	public void update(Topic topic) {
			this.getEntityManager().merge(topic);
	}
}