package com.spt.evt.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class ParticipantsDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(ParticipantsDaoTest.class);

	@Autowired
	private ParticipantsDao participantsDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private PersonDao personDao;

	@Test
	public void testFindByExampleShouldBeRoomId1() {
		Room room = this.roomDao.findById(1L);
		Participants participants = new Participants();
		participants.setModulator(true);
		participants.setRoom(room);
		List<Participants> participantsList = participantsDao.findByExample(participants);
		Assert.assertEquals(new Long(1),participantsList.get(0).getRoom().getId());
	}
	
	@Test
	public void testFindParticipantsByPersonShouldBeNotNull() {
		Person person = this.personDao.findById(2L);
		List<Participants> participantsList = participantsDao.findByPerson(person);
		Assert.assertNotNull(participantsList);
	}
/*
    @Test
    public  void testAddPaticipants(){
        Room room=new Room();
        room.setId(2L);
        Person person=new Person();
        person.setId(6L);
        this.participantsDao.addRequestCommittee(room,person);
        Participants participants = participantsDao.findById(1L);
        LOGGER.error("************************ {}",participants.getModulator());
        //Assert.assertEquals(null,participants.getModulator());
    }*/


}
