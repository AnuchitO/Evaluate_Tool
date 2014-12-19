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

    @Test
    public void testFindPersonWithRequestCommitteeShouldBeRoomId1(){
        Room room=this.roomDao.findById(1L);
        List<Participants> participantses=this.participantsDao.findPersonWithRequestCommittee(room);
        Assert.assertEquals("wait",participantses.get(0).getRole());
        Assert.assertEquals("see",participantses.get(1).getRole());
    }

    @Test
    public void testsetRoleInPaticipantsShouldBeParticipantId31AndRoleWait(){
        this.participantsDao.setRoleInPaticipants(31L,"wait");
        Participants participants=this.participantsDao.findById(31L);
        Assert.assertEquals("see",participants.getRole());
    }

    @Test
    public void testSetRoleInPaticipantsShouldBeParticipantId32AndRoleCommittee(){
        this.participantsDao.setRoleInPaticipants(32L,"committee");
        Participants participants=this.participantsDao.findById(32L);
        Assert.assertEquals("committee",participants.getRole());
    }

    @Test
    public void testAddRequestCommitteeShouldBeRoomId2AndPersonId8(){
        Room room=this.roomDao.findById(2L);
        Person person=this.personDao.findById(8L);
        this.participantsDao.addRequestCommittee(room,person);
        Long participantsId=this.participantsDao.findParticipantId(room, person);
        Participants participants=this.participantsDao.findById(33L);
        Assert.assertNotNull(participantsId);
        Assert.assertEquals(new Long(33),participantsId);
        Assert.assertEquals("wait",participants.getRole());
    }
    @Test
    public void testRemoveRequestCommitteeShouldBeRoomId2AndPersonId2(){
        Room room=this.roomDao.findById(2L);
        Person person=this.personDao.findById(2L);
        this.participantsDao.removeRequestCommittee(room,person);
        Participants participants=this.participantsDao.findById(6L);
        Assert.assertNull(participants);
    }

    @Test
    public void testAddModulatorAndUpdateCommitteeShouldBeRoomApproveId3AndPersonApproveId3AndPersonUpdateId2(){
        Room room=this.roomDao.findById(3L);
        Person personApprove=this.personDao.findById(3L);
        Person personUpdate=this.personDao.findById(2L);
        this.participantsDao.addModulatorAndUpdateCommittee(room,personApprove,personUpdate);
        Participants participantsApprove=this.participantsDao.findById(11L);
        Participants participantsUpdate=this.participantsDao.findById(10L);
        Assert.assertNotNull(participantsApprove);
        Assert.assertEquals(true,participantsApprove.getModulator());
        Assert.assertEquals("committee",participantsApprove.getRole());
        Assert.assertNotNull(participantsUpdate);
        Assert.assertEquals(false,participantsUpdate.getModulator());
        Assert.assertEquals("committee",participantsUpdate.getRole());
    }

    @Test
    public void testFindParticipantIdShouldBeRoomId1AndPersonId1(){
        Room room=this.roomDao.findById(1L);
        Person person=this.personDao.findById(6L);
        Long participantId=this.participantsDao.findParticipantId(room,person);
        Assert.assertEquals(new Long(1),participantId);
    }

    @Test
    public void testFindAllPersonToApproveShouldBeRoomId1(){
        Room room=this.roomDao.findById(1L);
        List<Participants> participantses=this.participantsDao.allPersonToApprove(room);
        Assert.assertNotNull(participantses);
        Assert.assertEquals("committee",participantses.get(0).getRole());
        Assert.assertEquals(new Long(3),participantses.get(0).getId());
        Assert.assertEquals(new Long(1),participantses.get(0).getRoom().getId());
        Assert.assertEquals(false,participantses.get(0).getModulator());
    }

}
