package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Participants;

public interface ParticipantsDao {
	public List<Participants> findByExample(Participants participants);
	//public List<Participants> findCommitteeByRoomId(Long id);
}
