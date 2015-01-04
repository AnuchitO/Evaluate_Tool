package com.spt.evt.dao.impl;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

@Repository
public class PersonDaoImpl extends TemplateEntityManagerDao implements PersonDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public Person findById(Long id) {
		return this.getEntityManager().find(Person.class, id);
	}

	@Override
    @Transactional(readOnly = true)
	public List<Person> findByUserNameAndPassword(String userName, String password) {
        Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Person.class);
                 criteria.add(Restrictions.eq("userName", userName));
                 criteria.add(Restrictions.eq("password", password));
		List<Person> result = criteria.list();
		return result;
	}
	
	@Override
	@Transactional
	public void persist(Person person){
		this.getEntityManager().persist(person);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Person> findAll() {
		Query query = this.getEntityManager().createQuery("FROM Person");
		return query.getResultList();
	}

	@Override
	@Transactional
	public void editProfile(Person dataperson){
		Person person = this.getEntityManager().find(Person.class, dataperson.getId());
		person.setName(dataperson.getName());
		person.setLastName(dataperson.getLastName());
		person.setGender(dataperson.getGender());
		person.setEmail(dataperson.getEmail());
		person.setUserName(dataperson.getUserName());
		person.setPassword(dataperson.getPassword());
		person.setPositionName(dataperson.getPositionName());
		person.setInstitute(dataperson.getInstitute());
		person.setPhone(dataperson.getPhone());
		person.setInternship(dataperson.getInternship());
		person.setFacebook(dataperson.getFacebook());
		this.getEntityManager().merge(person);
		this.getEntityManager().flush();
	}
}