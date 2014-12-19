package com.spt.evt.service.impl;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.json.JSONObject;

import com.spt.evt.dao.CourseDao;
import com.spt.evt.entity.Course;
import com.spt.evt.service.CourseService;

import org.springframework.transaction.annotation.Transactional;

@Service
public class CourseServiceImpl implements CourseService {
	private static final Logger logger = LoggerFactory
			.getLogger(CourseServiceImpl.class);

	@Autowired
	private CourseDao courseDao;

	@Override
	public Course findById(Long id) {
		return this.courseDao.findById(id);
	}

	@Override
	public JSONObject getAllCourse() {		
		List<Course> course = courseDao.findAll();						
		JSONObject report = generateScoreJsonObjectByCourse(course);
		return report;
	}

	private JSONObject generateScoreJsonObjectByCourse(List<Course> course) {
		JSONObject report = new JSONObject();
		for (Course courseForEach : course ) {
			JSONObject courseReport = new JSONObject();
			courseReport.put("courseName",courseForEach.getName());
			courseReport.put("courseDescription", courseForEach.getDescription());
			courseReport.put("courseId", courseForEach.getId());
			report.append("report", courseReport);
		}
		return report;
	}


	@Override
	@Transactional
	public String setData(String dataForm) {

		JSONObject jsonObj = new JSONObject(dataForm);
		
		Course course = new Course();

		course.setName(jsonObj.getString("courseName"));
		course.setDescription(jsonObj.getString("courseDescription"));
		System.out.println("SetValue");
		
		courseDao.persist(course);
		System.out.println("Persist Successful");

		return null;
	}

	@Override
	@Transactional
	public Long deleteDataById(Long id) {
		Course course = findById(id);
		this.courseDao.removeCourse(course);
		return null;
	}

}