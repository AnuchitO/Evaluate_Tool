package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Repository
public class ParticipantsDaoImpl extends TemplateEntityManagerDao implements ParticipantsDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ParticipantsDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public List<Participants> findByExample(Participants participants) {
		Query query = this.getEntityManager().createQuery("FROM Participants");
		return query.getResultList();
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Participants> findByRoom(Room room) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Participants.class);
		criteria.add(Restrictions.eq("room", room));
		List<Participants> result = criteria.list();
		return result;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Participants> findByPerson(Person person) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Participants.class);
		criteria.add(Restrictions.eq("person", person));
		List<Participants> result = criteria.list();
		return result;
	}
	
}
