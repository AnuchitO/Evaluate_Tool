package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;

@Repository
public class PersonDaoImpl extends TemplateHibernateDaoSupport implements
PersonDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(PersonDaoImpl.class);

	@Override
	public Person findById(Long id) {
		return (Person) this.getHibernateTemplate().get(Person.class, id);
	}

	@Override
	public List<Person> findByUserNameAndPassword(String userName, String password) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Person.class);
		criteria.add(Restrictions.eq("userName", userName));
		criteria.add(Restrictions.eq("password", password));
		List<Person> result = (List<Person>) this.getHibernateTemplate().findByCriteria(criteria);
		return result;
	}

}