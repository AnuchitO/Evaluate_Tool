package com.spt.evt.service;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.Topic;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface ReportService {
	public JSONObject getAllScore();
	public JSONObject getAllExaminerCompleted();
	public JSONObject getScoreByExaminer(Person examiner);
	public Map<Room,Map<Topic, List<Double>>> prepareDataScoreBoard(List<Room> rooms);
	public Person getPersonByExaminerId(Long examinerId);
	public JSONObject getCourseInformationSummary(Long roomId, Long examinerId, Long committeeId,Long courseId);
	public JSONObject generateScoreAverage(List<Room> rooms);
}