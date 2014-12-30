package com.spt.evt.service;

import org.json.JSONObject;

public interface ExaminationRoomService {
	public JSONObject getRoomInformation();
	public JSONObject getPersonInRoomInformation(Long roomId, Long examinerId, Long committeeId, Long modulatorId);
	public JSONObject findParticipantsByPersonId(Long personId);
    public void setStatusRoom(Long roomId);
    public void setStatusRoomReady(Long roomId);
    public String addRequestCommittee(Long roomId,Long personId);
    public Long removeRequestCommittee(Long roomId,Long personId);
    public void setAddRoom(String data);
    public void setremoveRoom(Long roomLongId);
    public void editRoom(String data);
}
