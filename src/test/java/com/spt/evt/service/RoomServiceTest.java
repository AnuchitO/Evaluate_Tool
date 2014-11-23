package com.spt.evt.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Room;

import static org.hamcrest.core.Is.is;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class RoomServiceTest extends AbstractTestService {
	private static final Logger LOGGER = LoggerFactory.getLogger(RoomServiceTest.class);

	@Autowired
	private RoomService roomService;
	
	@Test
	public void testFindAllRoomShouldBeNotNull() {
		List<Room> room = roomService.findAll();
		Assert.assertNotNull(room);
	}
	
	@Test
	public void testFindRoomByIdShouldBeNotNull() {
		Long roomId = 1L;
		Room room = roomService.findById(roomId);
		Assert.assertNotNull(room);
	}

	@Test
	public void testFindRoomByStatusShouldBeNotNull() {
		String status = "Completed";
		List<Room> rooms = this.roomService.findByStatus(status);
		Assert.assertNotNull(rooms);
		Assert.assertThat(rooms.get(0).getStatus(),is("Completed"));
	}
}
