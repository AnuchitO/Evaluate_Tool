package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.RoomDao;
import com.spt.evt.entity.Room;
import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import javax.persistence.EntityManager;
import javax.persistence.Query;

@Repository
public class RoomDaoImpl extends TemplateEntityManagerDao implements RoomDao {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(RoomDaoImpl.class);
	
	
	@Override
	@Transactional(readOnly = true)
	public List<Room> findAll() {
		Query query = this.getEntityManager().createQuery("from Room");
		return query.getResultList();
	}

	@Override
	@Transactional(readOnly = true)
	public Room findById(Long id) {
		return this.getEntityManager().find(Room.class, id);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Room> findByStatus(String status) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Room.class);
		criteria.add(Restrictions.eq("status", status));
		List<Room> resultRoom = criteria.list();
		return resultRoom;
	}

	@Override
	@Transactional
	public void setStatusByRoom(Room room) {
		room.setStatus("Completed");
		this.getEntityManager().merge(room);
	}

    @Override
    @Transactional
    public void setStatusRoomReady(Long roomId) {
        Room room=(Room)this.getEntityManager().find(Room.class,roomId);
        System.out.print("================="+room+"===================");
        room.setStatus("Ready");
        this.getEntityManager().merge(room);
    }

}
