package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

public interface ParticipantsDao {
	public List<Participants> findByExample(Participants participants);
	public List<Participants> findByRoom(Room room);
	public List<Participants> findByPerson(Person person);
    public List<Participants> findPersonWithRequestCommittee(Room room);
    public void setRoleInPaticipants(Long paticipantId);
    public String addRequestCommittee(Room room,Person person);
    public void removeRequestCommittee(Room room,Person person);
    public void addModulatorAndUpdateCommittee(Room roomApprove, Person personApprove, Person personInRoom);
    public Participants findById(Long id);
}
