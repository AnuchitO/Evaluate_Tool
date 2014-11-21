package com.spt.evt.service;

import org.json.JSONObject;

public interface ReportService {
	public JSONObject findByStatus();
	public JSONObject getScoreOfRoom(Long id);
}