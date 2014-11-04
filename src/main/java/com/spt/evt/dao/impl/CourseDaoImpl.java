package com.spt.evt.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.CourseDao;
import com.spt.evt.entity.Course;

@Repository
public class CourseDaoImpl extends AbstracHibernateDaoSupport implements
		CourseDao {
	private static final Logger logger = LoggerFactory.getLogger(CourseDaoImpl.class);

	@Override
	public Course findById(Long id) {
		logger.info("findById()");
		return (Course) this.getHibernateTemplate().get(Course.class, id);
	}
}