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

import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;
import javax.persistence.EntityManager;
import com.spt.evt.dao.impl.TemplateEntityManagerDao;

@Repository
public class SubjectDaoImpl extends TemplateEntityManagerDao implements
		SubjectDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(SubjectDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public List<Subject> findByCourse(Course course) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Subject.class);
		criteria.add(Restrictions.eq("course", course));
		criteria.addOrder(Order.asc("id"));
		List<Subject> result = criteria.list();
		return result;
	}
}