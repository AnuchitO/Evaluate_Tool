package com.spt.evt.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.CourseDao;
import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

@Repository
public class SubjectDaoImpl extends AbstracHibernateDaoSupport implements SubjectDao {
	private static final Logger logger = LoggerFactory
			.getLogger(SubjectDaoImpl.class);

	@Override
	public List<Subject> findByCourse(Course course) {
		return null;
	}
}