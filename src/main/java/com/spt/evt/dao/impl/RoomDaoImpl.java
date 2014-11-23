package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spt.evt.dao.RoomDao;
import com.spt.evt.entity.Room;

@Repository
public class RoomDaoImpl extends TemplateHibernateDaoSupport implements RoomDao {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(RoomDaoImpl.class);
	
	@Override
	public List<Room> findAll() {
		return  (List<Room>) this.getHibernateTemplate().find("from Room");
	}

	@Override
	public Room findById(Long id) {
		return this.getHibernateTemplate().get(Room.class, id);
	}
	
	@Override
	public List<Room> findByStatus(String status) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Room.class);
		criteria.add(Restrictions.eq("status", status));
		List<Room> resultRoom = (List<Room>) this.getHibernateTemplate().findByCriteria(criteria);
		return resultRoom;
	}

}
