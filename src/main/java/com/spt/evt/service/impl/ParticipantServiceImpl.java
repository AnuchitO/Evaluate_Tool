package com.spt.evt.service.impl;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ParticipantsService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParticipantServiceImpl implements ParticipantsService {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(ParticipantServiceImpl.class);

	@Autowired
	private ParticipantsDao participantsDao;

	@Override
	public List<Participants> findByRoom(Room room) {
		return this.participantsDao.findByRoom(room);
	}

	@Override
	public Person findByExaminerInRoom(Room room) {
		Person examiner = null;
		List<Participants> participants = this.participantsDao.findByRoom(room);

		for(Participants participant : participants){
			String role = participant.getRole();
			if(role.equals("examiner")){
				examiner = participant.getPerson();
				break;
			}
		}
		return examiner;
	}

	@Override
	public List<Participants> findByPerson(Person person) {
		return this.participantsDao.findByPerson(person);
	}

    @Override
    public List<Participants> findByPersonByRole(Person person) {
        return this.participantsDao.findByPersonByRole(person);
    }

    @Override
    public List<Participants> findPersonWithRequestCommittee(Room Room) {
        return this.participantsDao.findPersonWithRequestCommittee(Room);
    }

    @Override
    public void setRoleInPaticipants(Long paticipantId,String role) {
        this.participantsDao.setRoleInPaticipants(paticipantId,role);
    }

    @Override
    public String addRequestCommittee(Room room, Person person) {
        return this.participantsDao.addRequestCommittee(room,person);
    }

    @Override
    public Long removeRequestCommittee(Room room, Person person) {
       return this.participantsDao.removeRequestCommittee(room,person);
    }

    @Override
    public void addModulatorAndUpdateCommittee(Long roomIdApprove, Long yourIdApprove, Long yourIdInRoom) {
        Room roomApprove=new Room();
        roomApprove.setId(roomIdApprove);
        Person personApprove=new Person();
        personApprove.setId(yourIdApprove);
        Person personInRoom=new Person();
        personInRoom.setId(yourIdInRoom);
        this.participantsDao.addModulatorAndUpdateCommittee(roomApprove,personApprove,personInRoom);
    }

    @Override
    public Long findParticipantId(Long roomId, Long personId) {
        Room room=new Room();
        room.setId(roomId);
        Person person=new Person();
        person.setId(personId);
        return  this.participantsDao.findParticipantId(room,person);
    }

    @Override
    public JSONObject allPersonToApprove(Long aLong) {
        Room room=new Room();
        room.setId(aLong);
        List<Participants> listParticipants=this.participantsDao.allPersonToApprove(room);
        JSONObject allPersonToApprove=new JSONObject();
        JSONObject personEachRow=null;
        for(Participants participants:listParticipants){
                personEachRow=new JSONObject();
                personEachRow.put("id",participants.getPerson().getId());
                personEachRow.put("name",participants.getPerson().getName());
                personEachRow.put("lastname",participants.getPerson().getLastName());
                allPersonToApprove.append("person",personEachRow);
        }
        return allPersonToApprove;
    }
    
    @Override
    public void persisParticipant(Participants participants) {
        participantsDao.persistParticipants(participants);
    }

    @Override
    public void editPaticitant(Participants participants){
        participantsDao.editParticipants(participants);
    }
}
