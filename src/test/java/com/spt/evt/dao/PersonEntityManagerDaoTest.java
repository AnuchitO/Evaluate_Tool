package com.spt.evt.dao;

import com.spt.evt.entity.Person;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.Iterator;
import java.util.List;

import static org.hamcrest.core.Is.is;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class PersonEntityManagerDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonEntityManagerDaoTest.class);

	@Autowired
	private PersonEntityManagerDao personEntityManagerDao;

	@Test
	public void remark() {
		LOGGER.debug("/*** Begin test personEntityManagerDaoTest() ***/");
	}

	@Test
	public void testFindPersonByIdShouldBeNotNull() {
		Person person = this.personEntityManagerDao.findById(1L);
		Assert.assertNotNull(person);
	}

	@Test
	public void testFindPersonByUserNameAndPasswordShouldBeNotNull() {
		String userName = ("panupong_c");
		String password = ("panupong_c");

		List<Person> persons = this.personEntityManagerDao.findByUserNameAndPassword(userName, password);
        Person person = persons.get(0);
        Assert.assertThat(userName,is(person.getUserName()));
        Assert.assertThat(password,is(person.getPassword()));
	}

    @Test
    public void testPersitShoudBeIdNotNull() throws Exception {
        Person person = new Person();
        person.setName("Anuchit_test");
        person.setLastName("Prasertsang_test");
        person.setGender("genderadmin");
        person.setEmail("emailadmin@gmail.com");
        person.setPassword("passwordadmin");
        person.setInstitute("instituteadmin");
        person.setPhoneNumber("phonenumberadmin");
        person.setInternship("internshipadmin");
        person.setFacebook("facebookadmin");
        Assert.assertNull("Expected 'Person' identifier to be null", person.getId());
        this.personEntityManagerDao.persist(person);
//        Assert.assertNotNull("Expected 'Person' identifier to no longer be null", person.getId());

    }

    @Test
    public void testRemove() {
        Long id = 13L;
        Assert.assertNotNull("Data on demand for 'Person' failed to provide an identifier", id);
        Person person = this.personEntityManagerDao.findById(id);
        this.personEntityManagerDao.remove(person);
        Assert.assertNull("Failed to remove 'Person' with identifier '" + id + "'", this.personEntityManagerDao.findById(id));
    }

    @Test
    public void testMergeUpdate() {
        Long id = 14L;
        String name="Update";
        Person person = new Person();
        person.setId(id);
        person.setName(name);
        person = this.personEntityManagerDao.merge(person);
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", person.getName(), name);
        Person personUpdate = this.personEntityManagerDao.findById(id);
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", personUpdate.getName(), name);
    }
}
