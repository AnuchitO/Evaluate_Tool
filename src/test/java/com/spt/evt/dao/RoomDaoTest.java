package com.spt.evt.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

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
		LOGGER.debug("=================================="+rooms.toString());
		Assert.assertNotNull(rooms);
	}
}
