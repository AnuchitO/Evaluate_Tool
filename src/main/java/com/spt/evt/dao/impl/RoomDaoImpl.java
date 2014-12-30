package com.spt.evt.dao.impl;

import com.spt.evt.dao.RoomDao;
import com.spt.evt.entity.Room;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

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
        room.setStatus("Ready");
        this.getEntityManager().merge(room);
    }

    @Override
	@Transactional
	public void setAddRoom(Room dataroom){
		dataroom.setStatus("Waiting");
		this.getEntityManager().persist(dataroom);
		Query query = this.getEntityManager().createQuery("from Room");
		LOGGER.debug(query.getResultList().toString());
		LOGGER.debug("RoomDaoImplsetAddRoom");
	}

	@Override
	@Transactional
	public void setRemoveRoom(Long roomid){
		Room room = this.getEntityManager().find(Room.class,roomid);
		this.getEntityManager().remove(room);
		Query query = this.getEntityManager().createQuery("from Room");
		LOGGER.debug(query.getResultList().toString());

	}

	@Override
	@Transactional
	public void editRoom(Room dataroom){
		Room room = this.getEntityManager().find(Room.class, dataroom.getId());
		room.setName(dataroom.getName());
		this.getEntityManager().merge(room);
		Query query = this.getEntityManager().createQuery("from Room");
		LOGGER.debug(query.getResultList().toString());
		LOGGER.debug("EditRoomDAO");
	}
}
