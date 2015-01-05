package com.spt.evt.dao;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

import java.util.List;

public interface ParticipantsDao {
	public List<Participants> findByExample(Participants participants);
	public List<Participants> findByRoom(Room room);
	public List<Participants> findByPerson(Person person);
    public List<Participants> findPersonWithRequestCommittee(Room room);
    public void setRoleInPaticipants(Long paticipantId,String role);
    public String addRequestCommittee(Room room,Person person);
    public Long removeRequestCommittee(Room room, Person person);
    public void addModulatorAndUpdateCommittee(Room roomApprove, Person personApprove, Person personInRoom);
    public Participants findById(Long id);
    public Long findParticipantId(Room room,Person person);
    public List<Participants> allPersonToApprove(Room room);
    public void persistParticipants(Participants participants);
    public void editParticipants(Participants participants);
    public List<Participants> findByPersonByRole(Person person);
}
