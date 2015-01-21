package com.spt.evt.service;

import com.spt.evt.entity.Person;
import org.json.JSONObject;

import java.util.List;

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
    public void setStatusRoomTerminate(Long idRoom);
    public List<Person> findAll();
    public void editMemberProfile(String dataform);
    public Person dataProfile(Long idPerson);
    public void removeRoomInParticipants(Long id);
}
