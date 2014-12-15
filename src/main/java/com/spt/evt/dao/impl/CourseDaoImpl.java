package com.spt.evt.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import com.spt.evt.dao.CourseDao;
import com.spt.evt.entity.Course;
import javax.persistence.EntityManager;

@Repository
public class CourseDaoImpl extends TemplateEntityManagerDao implements CourseDao {
	private static final Logger logger = LoggerFactory.getLogger(CourseDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public Course findById(Long id) {
		logger.info("findById()");
		return this.getEntityManager().find(Course.class, id);
	}
}