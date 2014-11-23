package com.spt.evt.service;

import com.spt.evt.entity.Person;
import org.json.JSONObject;

public interface ReportService {
	public JSONObject findByStatus();
	public JSONObject getScoreOfRoom(Long id);
	public JSONObject getAllScore();
	public JSONObject getScoreByExaminer(Person examiner);
}