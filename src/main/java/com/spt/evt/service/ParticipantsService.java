package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

public interface ParticipantsService {
	public List<Participants> findByRoom(Room room);
	public Person findByExaminerInRoom(Room room);
	public List<Participants> findByPerson(Person person);
    public List<Participants> findPersonWithRequestCommittee(Room room);
    public void setRoleInPaticipants(Long paticipantId,String role);
    public String addRequestCommittee(Room room,Person person);
    public Long removeRequestCommittee(Room room,Person person);
    public void addModulatorAndUpdateCommittee(Long roomIdApprove, Long yourIdApprove, Long yourIdInRoom);
    public Long findParticipantId(Long roomId,Long personId);
}
