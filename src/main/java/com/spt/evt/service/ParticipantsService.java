package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;

public interface ParticipantsService {
	public List<Participants> findByRoom(Room room);
	public Person findByExaminerInRoom(Room room);
}
