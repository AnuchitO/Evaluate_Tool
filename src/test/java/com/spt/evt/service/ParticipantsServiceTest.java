package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Person;
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

	@Test
	public void testFindByExaminerInRoomShouldBeExaminerRole() throws Exception {
		Room room = new Room();
		room.setId(1L);
		Person examiner = this.participantsService.findByExaminerInRoom(room);
		Assert.assertEquals("Watcharaphong",examiner.getName());
	}
}
