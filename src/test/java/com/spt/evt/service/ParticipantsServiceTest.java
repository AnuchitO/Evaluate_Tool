package com.spt.evt.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;

public class ParticipantsServiceTest extends AbstractTestService{
	public static final Logger LOGGER = LoggerFactory.getLogger(ParticipantsServiceTest.class);

	@Autowired
	private ParticipantsService participantsService;

	@Test
	public void testFindParticipantsByRoomIdShouldBeNotNull() {
		Room room = new Room();
		room.setId(1L);
		Participants participants = new Participants();
		participants.setRoom(room);
		List<Participants> participantsList = this.participantsService.findByRoom(room);
		Assert.assertEquals(new Long(1),participantsList.get(0).getRoom().getId());		
	}

}
