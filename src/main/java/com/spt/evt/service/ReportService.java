package com.spt.evt.service;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.Topic;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface ReportService {
	public JSONObject findByStatus();
	public JSONObject getScoreOfRoom(Long id);
	public JSONObject getAllScore();
	public JSONObject getScoreByExaminer(Person examiner);
	public Map<Room,Map<Topic, List<Double>>> prepareDataScoreBoard(List<Room> rooms);
}