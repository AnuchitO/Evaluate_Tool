package com.spt.evt.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;

@Repository
public class ParticipantsDaoImpl extends TemplateHibernateDaoSupport implements ParticipantsDao {

	public List<Participants> findByExample(Participants participants) {
		return this.getHibernateTemplate().findByExample(participants);
	}
	
}
