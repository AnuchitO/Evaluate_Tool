package com.spt.evt.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spt.evt.dao.RoomDao;
import com.spt.evt.entity.Room;

@Repository
public class RoomDaoImpl extends TemplateHibernateDaoSupport implements RoomDao {

	@Override
	public List<Room> findAll() {
		return  (List<Room>) this.getHibernateTemplate().find("from Room");
	}

}
