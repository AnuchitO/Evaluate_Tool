package com.spt.evt.service;

import org.json.JSONObject;

public interface ExaminationRoomService {
	public JSONObject getRoomInformation();
	public JSONObject getPersonInformation(Long roomId, Long examinerId, Long committeeId);
}
