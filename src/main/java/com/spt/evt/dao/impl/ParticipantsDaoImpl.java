package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

@Repository
public class ParticipantsDaoImpl extends TemplateHibernateDaoSupport implements ParticipantsDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ParticipantsDaoImpl.class);
	public List<Participants> findByExample(Participants participants) {
		return this.getHibernateTemplate().findByExample(participants);
	}
	
	@Override
	public List<Participants> findByRoom(Room room) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Participants.class);
		criteria.add(Restrictions.eq("room", room));
		List<Participants> result = (List<Participants>) this.getHibernateTemplate().findByCriteria(criteria);
		return result;
	}
	
}
