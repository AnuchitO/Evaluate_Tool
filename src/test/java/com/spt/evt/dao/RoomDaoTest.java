package com.spt.evt.dao;

import java.util.List;
import java.util.Set;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;
/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class RoomDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(RoomDaoTest.class);

	@Autowired
	private RoomDao roomDao;

	@Test
	public void testFindAllRoomShouldBeNotNull() {
		List<Room> rooms = this.roomDao.findAll();
		Set<Participants> participantsSet = rooms.get(0).getParticipants();
		Assert.assertFalse(participantsSet.isEmpty());
		Assert.assertNotNull(rooms);
	}
	
}
