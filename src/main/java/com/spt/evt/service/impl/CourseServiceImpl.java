package com.spt.evt.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.CourseDao;
import com.spt.evt.entity.Course;
import com.spt.evt.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	private static final Logger logger = LoggerFactory
			.getLogger(CourseServiceImpl.class);

	@Autowired
	private CourseDao courseDao;

	public CourseDao getCourseDao() {
		return courseDao;
	}

	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	@Override
	public Course findById(Long id) {
		return this.getCourseDao().findById(id);
	}

}