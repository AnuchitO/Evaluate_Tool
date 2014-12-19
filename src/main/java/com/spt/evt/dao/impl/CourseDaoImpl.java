package com.spt.evt.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import com.spt.evt.dao.CourseDao;
import com.spt.evt.entity.Course;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Repository
public class CourseDaoImpl extends TemplateEntityManagerDao implements CourseDao {
	private static final Logger logger = LoggerFactory.getLogger(CourseDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public Course findById(Long id) {
		logger.info("findById()");
		return this.getEntityManager().find(Course.class, id);
	}

	@Override
	@Transactional
	public void persist(Course course){
		this.getEntityManager().persist(course);
		System.out.println("Save Suscess");
	}

	@Override
	@Transactional
	public void removeCourse(Course course){
		this.getEntityManager().remove(course);
		System.out.println("Remove Suscess");
	}

	@Override
	@Transactional(readOnly = true)
	public List<Course> findAll() {
		Query query = this.getEntityManager().createQuery("from Course");
		return query.getResultList();
	}
}