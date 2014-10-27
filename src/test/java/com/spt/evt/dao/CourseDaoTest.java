package com.spt.evt.dao;

import static org.hamcrest.core.Is.is;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Base;
import com.spt.evt.entity.Course;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class CourseDaoTest extends AbstractTestDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CourseDao courseDao;

	public CourseDao getCourseDao() {
		return courseDao;
	}

	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	@Test
	public void remark() {
		logger.debug("/*** Begin test CourseDaoTest() ***/");
	}

	@Test
	public void testFindCourseByIdBeNotNull() {
		Course course = this.getCourseDao().findById(1L);
		Assert.assertNotNull(course);
	}

}
