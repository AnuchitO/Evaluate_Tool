package com.spt.evt.service;

import org.json.JSONObject;

public interface CommitteeService {
	public JSONObject getCourseInformation(Long examinerId,Long committeeId,Long courseId);
}

