package com.spt.evt.service;

import org.json.JSONObject;

public interface ExaminationRoomService {
	public JSONObject getRoomInformation();
	public JSONObject getParticipantInformation();
	public JSONObject getPersonInformation(Long examinerId, Long committeeId);
}
