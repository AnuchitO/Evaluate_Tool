package com.spt.evt.dao;

import java.util.List;

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
public class ParticipantsTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(ParticipantsTest.class);

	@Autowired
	private ParticipantsDao participantsDao;

	@Test
	public void testFindByExampleShouldBeRoomId1() {
		Room room = new Room();
		room.setId(1L);
		Participants participants = new Participants();
		participants.setRoom(room);
		List<Participants> participantsList = participantsDao.findByExample(participants);
		Assert.assertEquals(new Long(1),participantsList.get(0).getRoom().getId());
	}

}
