package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;

public interface ParticipantService {
	public List<Participants> findByRoomId(Long id);
	//public List<Participants> findParticipantsByRole(Room roomId);
}
