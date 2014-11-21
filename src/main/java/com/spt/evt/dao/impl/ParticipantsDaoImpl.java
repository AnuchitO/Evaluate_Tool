package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;

@Repository
public class ParticipantsDaoImpl extends TemplateHibernateDaoSupport implements ParticipantsDao {

	public List<Participants> findByExample(Participants participants) {
		return this.getHibernateTemplate().findByExample(participants);
	}

//	@Override
//	public List<Participants> findCommitteeByRoomId(Long id) {
//		DetachedCriteria criteria = DetachedCriteria.forClass(Participants.class);
//		criteria.add(Restrictions.eq("role", "committee"));
//		List<Participants> resultParticipants = (List<Participants>) this.getHibernateTemplate().findByCriteria(criteria);
//		
//		return resultParticipants;
//	}
	
}
