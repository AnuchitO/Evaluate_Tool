package com.spt.evt.dao;

import com.spt.evt.entity.Room;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.hamcrest.core.Is.is;

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
		Assert.assertNotNull(rooms);
	}

	@Test
	public void testFindPersonByIdShouldBeNotNull() {
		Room room = this.roomDao.findById(1L);
		Assert.assertNotNull(room);
	}

	@Test
	public void testFindRoomByStatusShouldBeNotNull() {
		String status = "Completed";
		List<Room> rooms = this.roomDao.findByStatus(status);
		Assert.assertNotNull(rooms);
		Assert.assertThat(rooms.get(0).getStatus(),is("Completed"));
	}

    @Test
    public void testSetStatusRoomReadyShouldBeRoomId1(){
        this.roomDao.setStatusRoomReady(8L);
        Room room=this.roomDao.findById(8L);
        Assert.assertNotNull(room);
        Assert.assertThat(room.getStatus(),is("Ready"));
    }

//	@Test
//	public void testPersistShouldBeIdNotNull(){
//		Room room = new Room();
//		room.setName("roomName");
//		room.setDescription("description");
//		room.setNameexaminer("nameExaminer");
//		room.setNamecommittee("nameCommittee");
//		//room.setStartTime("2014-12-31 13:30");
//		//room.setEndTime("2014-12-31 18:30");
//		this.roomDao.setAddRoom(room);
//		LOGGER.debug("{}",room);
//		LOGGER.debug("{}",room.getId());
//		Assert.assertNotNull(room.getId());
//	}

	@Test
	public void testRemoveRoomShouldBeIdNull(){

		Room room = new Room();
		this.roomDao.setRemoveRoom(7L);

		LOGGER.debug("{}",room.getId());
		//Assert.assertNotNull(room.getId());
	}

}
