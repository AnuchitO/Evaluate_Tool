package com.spt.evt.controller;

import com.spt.evt.entity.Person;
import com.spt.evt.service.ExaminationRoomService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ExaminationRoomController {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(ExaminationRoomController.class);
	
	@Autowired
	private ExaminationRoomService examinationRoomService;

	@RequestMapping(value="/examinationRoom",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String yourId = request.getParameter("yourId");
		String yourPosition = request.getParameter("yourPosition");
		String yourName = request.getParameter("yourName");
		String yourLastName = request.getParameter("yourLastName");
		JSONObject roomInformation = this.examinationRoomService.getRoomInformation();
		Long personId = Long.parseLong(yourId);
		JSONObject memberEachRoom = this.examinationRoomService.findParticipantsByPersonId(personId);
		Map model = new HashMap();
		model.put("yourId", yourId);
		model.put("yourPosition", yourPosition);
		model.put("name", yourName);
		model.put("lastname", yourLastName);
		model.put("room", roomInformation.toString());
		model.put("memberEachRoom", memberEachRoom.toString());
		return new ModelAndView("examinationRoom", model);
	}

	@RequestMapping(value="/checkCommittee",method=RequestMethod.POST)
	public @ResponseBody String getCommitteeInformation(@RequestParam(value="dataPersonId") String dataPersonId ,HttpServletRequest arg0,HttpServletResponse arg1) {
		JSONObject personDetail = new JSONObject(dataPersonId);
		Long roomId		 	=personDetail.getLong("roomId");
		Long examinerId 	= personDetail.getLong("examinerId");
		Long committeeId 	= personDetail.getLong("committeeId");
		Long modulatorId	= personDetail.getLong("modulatorId");
		JSONObject committeeInformation = this.examinationRoomService.getPersonInRoomInformation(roomId,examinerId,committeeId,modulatorId);
		return committeeInformation.toString();
	}

    @RequestMapping(value="/setStatusRoomReady",method = RequestMethod.POST)
    public @ResponseBody String setStatusRoom(@RequestParam(value = "roomId") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject dataRoom=new JSONObject(data);
        Long idRoom=dataRoom.getLong("roomId");
        this.examinationRoomService.setStatusRoomReady(idRoom);
        return "success";
    }

    @RequestMapping(value="/setStatusRoomTerminate",method = RequestMethod.POST)
    public @ResponseBody String setStatusRoomTerminate(@RequestParam(value = "roomId") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject dataRoom=new JSONObject(data);
        Long idRoom=dataRoom.getLong("roomId");
        this.examinationRoomService.setStatusRoomTerminate(idRoom);
        return "success";
    }

    @RequestMapping(value="/addRequestCommittee",method=RequestMethod.POST)
    public @ResponseBody String addRequestCommitee(@RequestParam(value="dataPersonId") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject dataPerson=new JSONObject(data);
        Long personId=dataPerson.getLong("yourId");
        Long roomId=dataPerson.getLong("roomId");
        String message=this.examinationRoomService.addRequestCommittee(roomId,personId);
        return message;
    }

    @RequestMapping(value="/removeRequestCommittee",method=RequestMethod.POST)
    public @ResponseBody Long removeRequestCommitee(@RequestParam(value="dataPersonId") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject dataPerson=new JSONObject(data);
        Long personId=dataPerson.getLong("yourId");
        Long roomId=dataPerson.getLong("roomId");
        return this.examinationRoomService.removeRequestCommittee(roomId,personId);
    }

    @RequestMapping(value="/addRoom",method=RequestMethod.POST)
	public @ResponseBody String addRoom(@RequestParam(value="dataRoom")String data,HttpServletRequest request,HttpServletResponse response){
		this.examinationRoomService.setAddRoom(data);
		return null;
	}

	@RequestMapping(value="/removeRoom",method=RequestMethod.POST)
	public @ResponseBody String removeRoom(@RequestParam(value="dataId")String data,HttpServletRequest request,HttpServletResponse response){
		Long roomLongId = new Long(data);
		this.examinationRoomService.removeRoomInParticipants(roomLongId);
		this.examinationRoomService.setremoveRoom(roomLongId);
		return "success";
	}

	@RequestMapping(value="/editRoom",method=RequestMethod.POST)
	public @ResponseBody String editRoom(@RequestParam(value="editdata")String data,HttpServletRequest request,HttpServletResponse response){
		this.examinationRoomService.editRoom(data);
		return "success";
	}

	@RequestMapping(value="/sendName", method = RequestMethod.POST)
	public @ResponseBody String sendName(HttpServletRequest request,HttpServletResponse response) {
		JSONObject nameLarge = new JSONObject();
		JSONObject nameSmall = null;
		List<Person> result = this.examinationRoomService.findAll();
		for (Person person : result){
			nameSmall = new JSONObject();
			nameSmall.put("idPerson", person.getId());
			nameSmall.put("namePerson", person.getName());
			nameSmall.put("lastNamePerson", person.getLastName());
			nameLarge.append("idAndName", nameSmall);
		}
		return nameLarge.toString();
	}

	@RequestMapping(value="/editProfile",method=RequestMethod.POST)
	public @ResponseBody String editMemberProfile(@RequestParam(value="dataForm") String data, HttpServletRequest request,HttpServletResponse response){
		this.examinationRoomService.editMemberProfile(data);
		return data.toString();
	}

	@RequestMapping(value="/dataProfile", method = RequestMethod.POST)
	public @ResponseBody String sendDataProfile(@RequestParam(value="dataProfile") Long data, HttpServletRequest request,HttpServletResponse response) {
		Person person = this.examinationRoomService.dataProfile(data);
		JSONObject dataLarge = new JSONObject();
		JSONObject dataSmall = new JSONObject();
		dataSmall.put("namePerson", person.getName());
		dataSmall.put("lastNamePerson", person.getLastName());
		dataSmall.put("genderPerson", person.getGender());
		dataSmall.put("emailPerson", person.getEmail());
		dataSmall.put("userPerson", person.getUserName());
		dataSmall.put("positionPerson", person.getPositionName());
		dataSmall.put("institutePerson", person.getInstitute());
		dataSmall.put("phonePerson", person.getPhone());
		dataSmall.put("facebookPerson", person.getFacebook());
		dataSmall.put("internshipPerson", person.getInternship());
		dataLarge.append("dataPerson", dataSmall);
		return dataLarge.toString();
	}

}
