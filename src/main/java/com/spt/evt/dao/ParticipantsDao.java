package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

public interface ParticipantsDao {
	public List<Participants> findByExample(Participants participants);
	public List<Participants> findByRoom(Room room);
	public List<Participants> findByPerson(Person person);
}
