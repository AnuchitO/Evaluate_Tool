package com.spt.evt.service.impl;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ExaminationRoomService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ExaminationRoomServiceImpl extends ProviderService implements ExaminationRoomService {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ExaminationRoomServiceImpl.class);
	@Override
	public JSONObject getRoomInformation() {
		JSONObject allRoom = new JSONObject();
		JSONObject roomDetail = null;
		List<Room> rooms = this.getRoomService().findAll();
		for (Room room : rooms) {
			roomDetail = new JSONObject();
			roomDetail.put("id", room.getId());
			roomDetail.put("name",room.getName());
			roomDetail.put("courseId", room.getCourseId());
			roomDetail.put("description",room.getDescription());
			roomDetail.put("startTime",room.getStartTime().toString().substring(0, 16));
			roomDetail.put("endTime",room.getEndTime().toString().substring(0, 16));
			roomDetail.put("status",room.getStatus());

			Long roomId = room.getId();
			findExaminerAndModulator(roomDetail, room);			
			allRoom.append("room", roomDetail);
		}
		return allRoom;
	}

	private void findExaminerAndModulator(JSONObject roomDetail, Room room) {
		Long personModulatorId;
		String personModulatorName;
		String personModulatorLastName;
		String personModulator;
		Long personExaminerId;
		String personExaminerName;
		String personExaminerLastName;
		String personExaminer;
		Long personCommitteeId;
		String personCommitteeName;
		String personCommitteeLastName;
		String personCommittee;
		JSONObject personCommitteeInroom =null;
        JSONObject personExaminerInroom =null;
		List<Participants> participantsList = this.getParticipantsService().findByRoom(room);
		for(Participants participants : participantsList){
			Boolean isModulator = participants.getModulator();
			String role = participants.getRole();
			if(role.equals("examiner")){
                personExaminerInroom=new JSONObject();
				personExaminerId = participants.getPerson().getId();
				personExaminerName = participants.getPerson().getName();
				personExaminerLastName = participants.getPerson().getLastName();
				personExaminer = personExaminerName + " " + personExaminerLastName;
                roomDetail.put("examinerId", personExaminerId.toString());
                roomDetail.put("examiner", personExaminer);
                //personExaminerInroom.put("examinerId", personExaminerId.toString());
               // personExaminerInroom.put("examiner", personExaminer);
                //roomDetail.append("examiner",personExaminerInroom);
			}else if(isModulator){
				personModulatorId = participants.getPerson().getId();
				personModulatorName = participants.getPerson().getName();
				personModulatorLastName = participants.getPerson().getLastName();
				personModulator = personModulatorName +" "+ personModulatorLastName;
				roomDetail.put("modulatorId", personModulatorId);
				roomDetail.put("modulator", personModulator);
			}else if(!isModulator){
                personCommitteeInroom=new JSONObject();
                if(!participants.getRole().equals("wait")&&!participants.getRole().equals("see")){
                    personCommitteeId = participants.getPerson().getId();
                    personCommitteeName = participants.getPerson().getName();
                    personCommitteeLastName = participants.getPerson().getLastName();
                    personCommittee = personCommitteeName +" "+ personCommitteeLastName;
                    personCommitteeInroom.put("committeeId", personCommitteeId);
                    personCommitteeInroom.put("committee", personCommittee);
                    roomDetail.append("committee",personCommitteeInroom);
                }
            }
		}
	}

	@Override
	public JSONObject getPersonInRoomInformation(Long roomId, Long examinerId, Long committeeId, Long modulatorId) {
		JSONObject personInRoomInformation = new JSONObject();
		Room room			= this.getRoomService().findById(roomId);
		Person examiner 	= this.getPersonService().findById(examinerId);
		Person committee 	= this.getPersonService().findById(committeeId);
		Person modulator	= this.getPersonService().findById(modulatorId);
		personInRoomInformation.put("idRoom", room.getId());
		personInRoomInformation.put("idCourse", room.getCourseId());
		personInRoomInformation.put("idExaminer", examiner.getId());
		personInRoomInformation.put("nameExaminer", examiner.getName());
		personInRoomInformation.put("lastNameExaminer", examiner.getLastName());
		personInRoomInformation.put("idCommittee", committee.getId());
		personInRoomInformation.put("nameCommittee", committee.getName());
		personInRoomInformation.put("lastNameCommittee", committee.getLastName());
		personInRoomInformation.put("idModulator", modulator.getId());
		return personInRoomInformation;
	}

	public JSONObject findParticipantsByPersonId(Long personId) {
		JSONObject participantsDetail = new JSONObject();
		JSONObject personDetail = null;
		Person person = this.getPersonService().findById(personId);
		List<Participants> participants = findParticipantsByPerson(person);
		for(Participants participant : participants){
			personDetail = new JSONObject();
			personDetail.put("idRoom", participant.getRoom().getId());
			personDetail.put("idPerson", participant.getPerson().getId());
			participantsDetail.append("room", personDetail);
		}

		return participantsDetail;
	}

    @Override
    public void setStatusRoom(Long roomId) {
        Room room=new Room();
        room.setId(roomId);
        this.getRoomService().setStatusRoom(room);
    }

    @Override
    public void setStatusRoomReady(Long roomId) {
        this.getRoomService().setStatusRoomReady(roomId);
    }

    @Override
    public String addRequestCommittee(Long roomId, Long personId) {
        Room room=new Room();
        room.setId(roomId);
        Person person=new Person();
        person.setId(personId);
        return this.getParticipantsService().addRequestCommittee(room,person);

    }

    @Override
    public Long removeRequestCommittee(Long roomId, Long personId) {
         Room room=new Room();
         room.setId(roomId);
         Person person=new Person();
         person.setId(personId);
        return this.getParticipantsService().removeRequestCommittee(room,person);
    }

    public List<Participants> findParticipantsByPerson(Person person) {
		List<Participants> participants = this.getParticipantsService().findByPerson(person);
		return participants;
	}

	@Override
	public void setAddRoom(String data) {
		JSONObject jsonObj = new JSONObject(data);
		Room room = new Room();

		room.setName(jsonObj.getString("roomName"));
		room.setDescription(jsonObj.getString("description"));
		room.setCourseId(jsonObj.getLong("nameCourse"));

		String startDate = jsonObj.getString("startDate");
		String startTime = jsonObj.getString("startTime");
		String endTime = jsonObj.getString("endTime");
		String sumStartDateTime = startDate + " " + startTime;
		String sumEndDateTime = startDate + " " + endTime;
		DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date dateStartTime = null;
		Date dateEndTime = null;
		try {
			dateStartTime = formatDate.parse(sumStartDateTime);
			dateEndTime = formatDate.parse(sumEndDateTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		room.setStartTime(dateStartTime);
		room.setEndTime(dateEndTime);

		this.getRoomService().addRoom(room);

		Room roomLast = new Room();
		List<Room> roomList = getRoomService().findAll();

		int countAllList = 0;
		for (Room rm : roomList){
			countAllList++;
		}
		roomLast = roomList.get(countAllList-1);

		Person personExam = getPersonService().findById(jsonObj.getLong("nameExaminer"));
		Person personComit = getPersonService().findById(jsonObj.getLong("nameCommitti"));
		Participants participants = new Participants();
		participants.setPerson(personComit);
		participants.setModulator(true);
		participants.setRole("committee");
		participants.setRoom(roomLast);
		this.getParticipantsService().persisParticipant(participants);

		Participants participants2 = new Participants();
		participants2.setPerson(personExam);
		participants2.setModulator(false);
		participants2.setRole("examiner");
		participants2.setRoom(roomLast);
		this.getParticipantsService().persisParticipant(participants2);
	}

	@Override
	public void setremoveRoom(Long roomLongId){
		this.getRoomService().removeRoom(roomLongId);
	}

	@Override
	public void editRoom(String data){
		JSONObject jsonObj = new JSONObject(data);
		Room room = new Room();
		room.setId(jsonObj.getLong("roomId"));
		room.setName(jsonObj.getString("roomName"));
		room.setDescription(jsonObj.getString("description"));
		room.setCourseId(jsonObj.getLong("nameCourse"));
		String startDate = jsonObj.getString("startDate");
		String startTime = jsonObj.getString("startTime");
		String endTime = jsonObj.getString("endTime");
		String sumStartDateTime = startDate + " " + startTime;
		String sumEndDateTime = startDate + " " + endTime;
		DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date dateStartTime = null;
		Date dateEndTime = null;
		try {
			dateStartTime = formatDate.parse(sumStartDateTime);
			dateEndTime = formatDate.parse(sumEndDateTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		room.setStartTime(dateStartTime);
		room.setEndTime(dateEndTime);

		this.getRoomService().editRoom(room);

		Person personExam = getPersonService().findById(jsonObj.getLong("nameExaminer"));
		Person personComit = getPersonService().findById(jsonObj.getLong("nameCommitti"));
		Participants participants = new Participants();
		participants.setPerson(personComit);
		participants.setModulator(true);
		participants.setRole("committee");
		participants.setRoom(room);
		this.getParticipantsService().editPaticitant(participants);

		Participants participants2 = new Participants();
		participants2.setPerson(personExam);
		participants2.setModulator(false);
		participants2.setRole("examiner");
		participants2.setRoom(room);
		this.getParticipantsService().editPaticitant(participants2);
	}

    @Override
    public void setStatusRoomTerminate(Long idRoom) { this.getRoomService().setStatusRoomTerminate(idRoom);}
}
