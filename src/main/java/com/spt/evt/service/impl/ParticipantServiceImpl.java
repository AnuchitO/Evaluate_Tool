package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ParticipantService;

public class ParticipantServiceImpl implements ParticipantService {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(ParticipantServiceImpl.class);
	
	@Override
	public List<Participants> findByRoomId(Long id) {
		
		return null;
	}

//	@Override
//	public List<Participants> findParticipantsByRole(Room roomId) {
//		
//		return null;
//	}

}
