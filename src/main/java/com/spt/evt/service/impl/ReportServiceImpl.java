package com.spt.evt.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.spt.evt.entity.*;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.service.ReportService;

@Service
public class ReportServiceImpl extends ProviderService implements ReportService{
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportServiceImpl.class);

	@Override
	public JSONObject findByStatus() {
		JSONObject roomDetailSend = new JSONObject();
		JSONObject roomDetail = null;
		List<Room> rooms = this.getRoomService().findByStatus("Completed");
		for (Room room : rooms) {
			roomDetail = new JSONObject();
			roomDetail.put("id", room.getId());
			roomDetail.put("name",room.getName());
			roomDetail.put("description",room.getDescription());
			roomDetail.put("startTime",room.getStartTime());
			roomDetail.put("endTime",room.getEndTime());
			roomDetail.put("status",room.getStatus());

			Long personExaminerId;
			String personExaminerName;
			String personExaminerLastName;
			String personExaminer;

			Set<Participants> participantsSet = room.getParticipants();
			for(Participants participants : participantsSet){
				String role = participants.getRole();

				if(role.equals("examiner")){
					personExaminerId = participants.getPerson().getId();
					personExaminerName = participants.getPerson().getName();
					personExaminerLastName = participants.getPerson().getLastName();
					personExaminer = personExaminerName + " " + personExaminerLastName;
					roomDetail.put("examinerId", personExaminerId.toString());
					roomDetail.put("examiner", personExaminer);
				}
			}
			roomDetailSend.append("room", roomDetail);
		}
		return roomDetailSend;
	}

	@Override
	public JSONObject getScoreOfRoom(Long id) {
		Room rooms = this.getRoomService().findById(id);
		JSONObject	roomScore = new JSONObject();

		return roomScore;
	}

	@Override
	public JSONObject getAllScore() {
		String roomStatus = "Completed";
		List<Room> rooms = this.getRoomService().findByStatus(roomStatus);
		JSONObject report = generateScoreJsonObjectByRoom(rooms);
		return report;
	}

	private JSONObject generateScoreJsonObjectByRoom(List<Room> rooms) {
		Map<Room,Map<Topic,List<Double>>> scoreExaminerAll = prepareDataScoreBoard(rooms);
		Map<Room, Map<String, Object>> scoreCalculateds = this.getAveragesCalculationService().calculation(scoreExaminerAll);
		JSONObject report = new JSONObject();

		for(Room keyScoreCalculated : scoreCalculateds.keySet()){
			JSONObject examinerReport = new JSONObject();

			Map<String, Object> scoreMap = scoreCalculateds.get(keyScoreCalculated);
			for(String key: scoreMap.keySet()) {
				examinerReport.put(key, scoreMap.get(key));
			}

			Person examiner = this.getParticipantsService().findByExaminerInRoom(keyScoreCalculated);
			examinerReport.put("examinerId",examiner.getId());
			examinerReport.put("examiner", examiner.getName()+" "+examiner.getLastName());
			DateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			examinerReport.put("dateTest", formatDate.format(keyScoreCalculated.getStartTime()));

			report.append("report", examinerReport);
		}
		return report;
	}

	@Override
	public Map<Room,Map<Topic, List<Double>>> prepareDataScoreBoard(List<Room> rooms) {
		Map<Room,Map<Topic,List<Double>>> scoreExaminerAll = new HashMap<Room,Map<Topic,List<Double>>>();

		for (Room room : rooms) {
			List<ScoreBoard> scoreBoards = this.getScoreBoardService().findByRoom(room);
			Map<Topic,List<Double>> scoreEachTopicExaminer = new HashMap<Topic,List<Double>>();

			groupScoreOfTopic(scoreEachTopicExaminer, scoreBoards);

			scoreExaminerAll.put(room, scoreEachTopicExaminer);
		}
		return scoreExaminerAll;
	}

	public void groupScoreOfTopic(Map<Topic, List<Double>> scoreEachTopicExaminer, List<ScoreBoard> scoreBoards) {
		for(ScoreBoard scoreBoard:scoreBoards) {
            List<Double> scoreTopic = null;
            Topic topic = scoreBoard.getTopic();
            Double score = new Double(scoreBoard.getScore());

            if (scoreEachTopicExaminer.containsKey(topic)) {
                scoreTopic = scoreEachTopicExaminer.get(topic);
                scoreTopic.add(score);
            } else {
                scoreTopic = new ArrayList<Double>();
                scoreTopic.add(score);
                scoreEachTopicExaminer.put(topic, scoreTopic);
            }
        }
	}

	@Override
	public JSONObject getScoreByExaminer(Person examiner) {
		return null;
	}

}
