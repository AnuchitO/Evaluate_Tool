package com.spt.evt.service.impl;

import java.util.List;
import java.util.Set;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ExaminationRoomService;

@Service
public class ExaminationRoomServiceImpl extends ProviderService implements ExaminationRoomService {

	@Override
	public JSONObject getRoomInformation() {
		JSONObject allRoom = new JSONObject();
		JSONObject roomDetail = null;
		List<Room> rooms = this.getRoomService().findAll();
		for (Room room : rooms) {
			roomDetail = new JSONObject();
			roomDetail.put("id", room.getId());
			roomDetail.put("name",room.getName());
			roomDetail.put("description",room.getDescription());
			roomDetail.put("startTime",room.getStartTime());
			roomDetail.put("endTime",room.getEndTime());
			roomDetail.put("status",room.getStatus());

			String personCommitteeName;
			String personCommitteeLastName;
			String personCommittee;
			String personExaminerName;
			String personExaminerLastName;
			String personExaminer;
			Set<Participants> participantsSet = room.getParticipants();
			for(Participants participants : participantsSet){
				Boolean check = participants.getModulator();
				String role = participants.getRole();
				if(role.equals("examiner")){
					personExaminerName = participants.getPerson().getName();
					personExaminerLastName = participants.getPerson().getLastName();
					personExaminer = personExaminerName + " " + personExaminerLastName;
					roomDetail.put("examiner", personExaminer);
				}
				if(check == true){
					personCommitteeName = participants.getPerson().getName();
					personCommitteeLastName = participants.getPerson().getLastName();
					personCommittee = personCommitteeName +" "+ personCommitteeLastName;
					roomDetail.put("modulator", personCommittee);
				}

			}
			allRoom.append("room", roomDetail);
			
		}
		System.out.println("==================="+allRoom);
		return allRoom;
	}

	@Override
	public JSONObject getParticipantInformation() {
		JSONObject allParticipant = new JSONObject();

		return null;
	}

	@Override
	public JSONObject getPersonInformation(Long examinerId, Long committeeId) {
		JSONObject committeeInformation = new JSONObject();
		Person examiner 	= this.getPersonService().findById(examinerId);
		Person committee 	= this.getPersonService().findById(committeeId);
		committeeInformation.put("idExaminer", examiner.getId());
		committeeInformation.put("nameExaminer", examiner.getName());
		committeeInformation.put("lastNameExaminer", examiner.getLastName());
		committeeInformation.put("idCommittee", committee.getId());
		committeeInformation.put("nameCommittee", committee.getName());
		committeeInformation.put("lastNameCommittee", committee.getLastName());
		System.out.println("======="+committeeInformation);

		return committeeInformation;
	}

}
