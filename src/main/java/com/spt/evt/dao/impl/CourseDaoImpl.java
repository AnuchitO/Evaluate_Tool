package com.spt.evt.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.CourseDao;
import com.spt.evt.entity.Course;

@Repository
public class CourseDaoImpl extends AbstracHibernateDaoSupport implements
		CourseDao {
	private static final Logger logger = LoggerFactory.getLogger(CourseDaoImpl.class);

	@Override
	public Course findById(Long id) {
		logger.error("findById()");
		return (Course) this.getHibernateTemplate().get(Course.class, id);
	}
}