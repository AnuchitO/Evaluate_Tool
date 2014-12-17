package com.spt.evt.service.impl;

import java.util.List;

import com.spt.evt.entity.Person;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ParticipantsService;

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
    public List<Participants> findPersonWithRequestCommittee(Room Room) {
        return this.participantsDao.findPersonWithRequestCommittee(Room);
    }

    @Override
    public void setRoleInPaticipants(Long paticipantId) {
        this.participantsDao.setRoleInPaticipants(paticipantId);
    }

    @Override
    public String addRequestCommittee(Room room, Person person) {
        return this.participantsDao.addRequestCommittee(room,person);
    }

    @Override
    public void removeRequestCommittee(Room room, Person person) {
        this.participantsDao.removeRequestCommittee(room,person);
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


}
