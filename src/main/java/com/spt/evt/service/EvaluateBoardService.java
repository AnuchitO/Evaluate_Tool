package com.spt.evt.service;

import org.json.JSONObject;

public interface EvaluateBoardService {
	public JSONObject getCourseInformation(Long roomId, Long examinerId,Long committeeId,Long courseId);
	public String scoring(Long roomId, Long committeeId,Long examinerId,Long topicId,Double score,String comment);
	public String getCourseName(Long courseId);
	public void setStatusRoom(Long roomId);
	public JSONObject getAllPerson();
    public JSONObject getUserWithRequestCommittee(Long roomId);
    public void setRoleInPaticipants(Long paticipantId,String role);
    public void addModulatorAndUpdateCommittee(Long roomIdApprove,Long yourIdApprove,Long yourIdInRoom);
    public Long findParticipantId(Long roomId,Long personId);

    public JSONObject getallPersonToApprove(Long aLong);
}

