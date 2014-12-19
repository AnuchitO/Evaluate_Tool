package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Person;
import org.json.JSONObject;
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

    @Test
    public void testFindPersonWithRequestCommitteeShouldBeRoomId1(){
        Room room=new Room();
        room.setId(1L);
        List<Participants> participantses=this.participantsService.findPersonWithRequestCommittee(room);
        Assert.assertEquals("wait",participantses.get(0).getRole());
        Assert.assertEquals(false,participantses.get(0).getModulator());
    }

    @Test
    public void testSetRoleInPaticipantsShouldBeParticipantId31AndRoleWaitAndPersonId8(){
        Long participantId=31L;
        String role="wait";
        Person person=new Person();
        person.setId(8L);
        this.participantsService.setRoleInPaticipants(participantId,role);
        List<Participants> participants=this.participantsService.findByPerson(person);
        Assert.assertEquals("see", participants.get(1).getRole());
    }

    @Test
    public void testSetRoleInPaticipantsShouldBeParticipantId32AndRoleCommitteeAndPersonId7(){
        Long participantId=32L;
        String role="committee";
        Person person=new Person();
        person.setId(7L);
        this.participantsService.setRoleInPaticipants(participantId,role);
        List<Participants> participants=this.participantsService.findByPerson(person);
        Assert.assertEquals("committee",participants.get(1).getRole());
    }

    @Test
    public void testRemoveRequestCommitteeShouldBeRoomId5AndPersonId5(){
        Room room=new Room();
        room.setId(5L);
        Person person=new Person();
        person.setId(5L);
        Long participantIdRemove=this.participantsService.removeRequestCommittee(room,person);
        Assert.assertEquals(new Long(19),participantIdRemove);
    }

    @Test
    public void testAddModulatorAndUpdateCommitteeShouldBeRoomApproveId3AndPersonApproveId3AndPersonUpdateId2(){
        Long roomApprove=3L;
        Long personApprove=3L;
        Long personUpdate=2L;
        this.participantsService.addModulatorAndUpdateCommittee(roomApprove,personApprove,personUpdate);
        Room room=new Room();
        room.setId(3L);
        List<Participants> participantses=this.participantsService.findByRoom(room);
        Assert.assertEquals(false, participantses.get(1).getModulator());
        Assert.assertEquals("committee", participantses.get(1).getRole());
        Assert.assertEquals(true, participantses.get(2).getModulator());
        Assert.assertEquals("committee",participantses.get(2).getRole());
    }

    @Test
    public void testFindParticipantIdShouldBeRoomId1AndPersonId1(){
        Long roomId=1L;
        Long personId=1L;
        Long participantsId=this.participantsService.findParticipantId(roomId,personId);
        Assert.assertEquals(new Long(4),participantsId);
    }

    @Test
    public void testAllPersonToApproveShouldBeRoomId1(){
        Long roomId=1L;
        JSONObject allPersonToApprove=this.participantsService.allPersonToApprove(roomId);
        Assert.assertNotNull(allPersonToApprove);
        Assert.assertNotNull(allPersonToApprove.getJSONArray("person"));
    }
}
