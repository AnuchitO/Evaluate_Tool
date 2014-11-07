package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.Subject;
import com.spt.evt.service.ExaminationRoomService;
import com.spt.evt.service.PersonService;

@Service
public class ExaminationRoomServiceImpl extends ProviderService implements ExaminationRoomService {

	@Override
	public JSONObject getRoomInformation() {
		JSONObject roomDetail = null;
		List<Room> rooms = this.getRoomService().findAll();
		for (Room room : rooms) {
			roomDetail = new JSONObject();
			roomDetail.put("id", room.getId());
			roomDetail.put("name",room.getName());
			roomDetail.put("description",room.getDescription());
			roomDetail.put("examiner",room.getExaminer());
			roomDetail.put("modulator",room.getModulator());
			roomDetail.put("status",room.getStatus());
		}

		return roomDetail;
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
