package com.spt.evt.dao;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Course;

import java.util.List;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class CourseDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(CourseDaoTest.class);

	@Autowired
	private CourseDao courseDao;

	@Test
	public void remark() {
		LOGGER.debug("/*** Begin test CourseDaoTest() ***/");
	}

	@Test
	public void testFindCourseByIdBeNotNull() {
		Course course = this.courseDao.findById(1L);
		Assert.assertNotNull(course);
	}

	@Test
	public void testPersistCourse() {
		Course course = new Course();
		course.setName("courseName");
		course.setDescription("courseDescription");
		courseDao.persist(course);
		Assert.assertNotNull(courseDao.findById(2L));
	}

	@Test
	public void testUpdateCourse(){
		Course course = courseDao.findById(1L);
		course.setId(1L);
		course.setName("Course Edit");
		course.setDescription("Descrip Edit");
		courseDao.update(course);
		Course courseAffter = courseDao.findById(1L);
		Assert.assertTrue("Course Edit".equals(courseAffter.getName()));
		Assert.assertTrue("Descrip Edit".equals(courseAffter.getDescription()));
	}

}
