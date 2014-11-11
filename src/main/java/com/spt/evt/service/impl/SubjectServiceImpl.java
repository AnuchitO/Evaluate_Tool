package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;
import com.spt.evt.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(SubjectServiceImpl.class);

	@Autowired
	private SubjectDao subjectDao;

	@Override
	public List<Subject> findByCourse(Course course) {
		return this.subjectDao.findByCourse(course);
	}
	
}