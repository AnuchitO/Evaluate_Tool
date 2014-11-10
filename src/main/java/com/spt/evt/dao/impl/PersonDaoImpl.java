package com.spt.evt.dao.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;

@Repository
public class PersonDaoImpl extends TemplateHibernateDaoSupport implements
		PersonDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(PersonDaoImpl.class);

	@Override
	public Person findById(Long id) {
		return (Person) this.getHibernateTemplate().get(Person.class, id);
	}

}