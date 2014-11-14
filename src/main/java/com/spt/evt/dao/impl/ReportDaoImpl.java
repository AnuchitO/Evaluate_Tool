package com.spt.evt.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.ReportDao;
import com.spt.evt.entity.Room;

@Repository
public class ReportDaoImpl extends TemplateHibernateDaoSupport implements ReportDao {
	
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ReportDaoImpl.class);
	
	@Override
	public List<Room> findByStatus() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Room.class);
		criteria.add(Restrictions.eq("status", "Done"));
		//criteria.add(Restrictions.)
		List<Room> resultRoom = (List<Room>) this.getHibernateTemplate().findByCriteria(criteria);
		//LOGGER.debug("SIZE--------"+resultRoom.size());
		//LOGGER.debug("===All Room==="+resultRoom);
		//for(Room c:resultRoom){
		//	this.getHibernateTemplate().initialize(c.getParticipants());
		//}
		
		//LOGGER.debug("==="+resultRoom);
		return resultRoom;
	}

}
