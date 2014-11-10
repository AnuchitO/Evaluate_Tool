package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Participants;

public interface ParticipantService {
	
	public List<Participants> findByRoomId(Long id);

}
