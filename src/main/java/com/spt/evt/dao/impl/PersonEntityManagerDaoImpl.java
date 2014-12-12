package com.spt.evt.dao.impl;

import com.spt.evt.dao.PersonEntityManagerDao;
import com.spt.evt.entity.Person;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.PersistenceContext;
import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class PersonEntityManagerDaoImpl extends  TemplateEntityManagerDao  implements PersonEntityManagerDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonEntityManagerDaoImpl.class);

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
    public void persist(Person person) {
        this.getEntityManager().persist(person);
    }

    @Override
    @Transactional
    public void remove(Person person) {
        this.getEntityManager().remove(this.getEntityManager().contains(person) ? person : this.getEntityManager().merge(person));
    }

    @Override
    @Transactional
    public void flush() {
        this.getEntityManager().flush();
    }

    @Transactional
    public Person merge(Person person) {
        Person merged = this.getEntityManager().merge(person);
        this.getEntityManager().flush();
        return merged;
    }

}