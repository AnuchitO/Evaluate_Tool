package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.dao.CourseDao;
import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Base;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.CourseService;
import com.spt.evt.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService {
	private static final Logger logger = LoggerFactory
			.getLogger(SubjectServiceImpl.class);

	@Autowired
	private SubjectDao subjectDao;

	public SubjectDao getSubjectDao() {
		return subjectDao;
	}

	public void setSubjectDao(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}

	@Override
	public List<Subject> findByCourse(Course course) {
		return this.getSubjectDao().findByCourse(course);
	}
	
}