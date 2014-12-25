package com.spt.evt.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class SubjectDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(SubjectDaoTest.class);

	@Autowired
	private SubjectDao subjectDao;

	@Autowired
	private CourseDao courseDao;

	@Test
	public void testFindSubjectByCourseShouldBeNotNull() {
		Course course = new Course();
		course.setId(1L);
		List<Subject> subjects = this.subjectDao.findByCourse(course);
		Assert.assertNotNull(subjects);
	}

	@Test
	public void testPersistSubject() {
		Course course = courseDao.findById(1L);
		Subject subject = new Subject();
		subject.setName("Subject Edit");
		subject.setDescription("Descrip Edit");
		subject.setCourse(course);
		subjectDao.persist(subject);
		Assert.assertNotNull(subjectDao.findById(12L));
	}

	@Test
	public void testUpdateSubject(){
		Course course = courseDao.findById(1L);
		Subject subject = subjectDao.findById(1L);
		subject.setId(1L);
		subject.setName("Subject Edit");
		subject.setDescription("Descrip Edit");
		subject.setCourse(course);
		subjectDao.update(subject);
		Subject subjectAffter = subjectDao.findById(1L);
		Assert.assertTrue("Subject Edit".equals(subjectAffter.getName()));
		Assert.assertTrue("Descrip Edit".equals(subjectAffter.getDescription()));
	}

}
