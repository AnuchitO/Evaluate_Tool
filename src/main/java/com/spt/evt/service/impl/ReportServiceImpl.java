package com.spt.evt.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.RoomDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ReportService;

@Service
public class ReportServiceImpl extends ProviderService implements ReportService{


	private static final Logger LOGGER = LoggerFactory
			.getLogger(ReportServiceImpl.class);

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
		List<ScoreBoard> scoreBoardAll = new ArrayList<ScoreBoard>();
		for (Room room : rooms) {
			List<ScoreBoard> scoreBoards = this.getScoreBoardService().findByRoom(room);

			if(!scoreBoards.isEmpty()) {
				scoreBoardAll.addAll(scoreBoards);
			}
		}
		return null;
	}

	@Override
	public JSONObject getScoreByExaminer(Person examiner) {
		return null;
	}

}
