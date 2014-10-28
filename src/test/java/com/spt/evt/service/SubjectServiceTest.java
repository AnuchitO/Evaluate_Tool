package com.spt.evt.service;

import static org.hamcrest.core.Is.is;

import java.util.List;

import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Subject;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class SubjectServiceTest extends AbstractTestService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SubjectDao subjectDao;

	public SubjectDao getSubjectDao() {
		return subjectDao;
	}

	public void setSubjectDao(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
	}

	@Test
	public void remark() {
		logger.debug("-= Begin test SubjectServiceTest() =-");
	}

	@Test
	public void testFindSubjectByCourseShouldBeNotNull() {
		Course course = new Course();
		course.setId(1L);
		List<Subject> subjects = this.getSubjectDao().findByCourse(course);
		Assert.assertNotNull(subjects);
	}

}
