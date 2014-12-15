package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.MemberRegister;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import javax.persistence.EntityManager;
import javax.persistence.Query;

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
	
}