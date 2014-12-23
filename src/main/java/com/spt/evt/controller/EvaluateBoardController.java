package com.spt.evt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
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

import com.spt.evt.service.EvaluateBoardService;

@Controller
public class EvaluateBoardController {
	private static final Logger LOGGER = LoggerFactory.getLogger(EvaluateBoardController.class);
	@Autowired
	private EvaluateBoardService evaluateBoardService;

	@RequestMapping(value="/evaluateBoard",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String idRoom = request.getParameter("idRoom");
		String idCourse = request.getParameter("idCourse");
		String idExaminer = request.getParameter("idExaminer");
		String nameExaminer = request.getParameter("nameExaminer");
		String lastNameExaminer = request.getParameter("lastNameExaminer");
		String idCommittee = request.getParameter("idCommittee");
		String nameCommittee = request.getParameter("nameCommittee");
		String lastNameCommittee = request.getParameter("lastNameCommittee");
		String idModulator = request.getParameter("idModulator");
		String yourPosition = request.getParameter("yourPosition");
        String roomName=request.getParameter("roomName");
        String roomDescription=request.getParameter("roomDescription");
		String idCourseName = getCourseName(idCourse);
		Map model = new HashMap();
		model.put("idRoom", idRoom);
		model.put("idCourse", idCourse);
		model.put("nameCourse", idCourseName);
		model.put("idExaminer", idExaminer);
		model.put("nameExaminer", nameExaminer);
		model.put("lastNameExaminer", lastNameExaminer);
		model.put("idCommittee", idCommittee);
		model.put("nameCommittee", nameCommittee);
		model.put("lastNameCommittee", lastNameCommittee);
		model.put("idModulator", idModulator);
		model.put("yourPosition", yourPosition);
        model.put("roomName", roomName);
        model.put("roomDescription", roomDescription);
		return new ModelAndView("evaluateBoard",model);

	}

	@RequestMapping(value="/evaluateBoardTopicList",method=RequestMethod.POST)
	public @ResponseBody String receiveCourseData(@RequestParam(value="data") String data ,HttpServletRequest arg0,
			HttpServletResponse arg1)  {
		JSONObject courseDetail = new JSONObject(data);
		Long roomId			= Long.parseLong(courseDetail.getString("roomId"));
		Long examinerId 	= Long.parseLong(courseDetail.getString("examinerId"));
		Long committeeId 	= Long.parseLong(courseDetail.getString("committeeId"));		
		Long courseId 		= Long.parseLong(courseDetail.getString("courseId"));
		JSONObject courseInformation = this.evaluateBoardService.getCourseInformation(roomId,examinerId,committeeId , courseId);

		return courseInformation.toString();

	}

	@RequestMapping(value="/scoring",method=RequestMethod.POST)
	public @ResponseBody String scoring(@RequestParam(value="dataDetailScoreOfTopic") String data ,HttpServletRequest arg0,HttpServletResponse arg1) {
		JSONObject scoreExaminer = new JSONObject(data);
		Long roomId			= scoreExaminer.getLong("roomId");
		Long examinerId 	= scoreExaminer.getLong("examinerId");
		Long committeeId 	= scoreExaminer.getLong("committeeId");
		Long topicId 		= scoreExaminer.getLong("topicId");
		Double score 		= scoreExaminer.getDouble("score");
		String comment 		= scoreExaminer.getString("comment");

		String status = this.evaluateBoardService.scoring(roomId, committeeId, examinerId, topicId, score, comment);
		return status;
	}

	public String getCourseName(String courseId){
		Long idCourse = Long.parseLong(courseId);
		String nameCourse = evaluateBoardService.getCourseName(idCourse);
		return nameCourse;	
	}
	
	@RequestMapping(value="/setStatus",method=RequestMethod.POST)
	public @ResponseBody String setStatusRoom(@RequestParam(value="roomId") String data ,HttpServletRequest request,HttpServletResponse response){
		
		JSONObject room = new JSONObject(data);
		Long roomId = room.getLong("roomId");
		this.evaluateBoardService.setStatusRoom(roomId);
		return "Success";
	}

    @RequestMapping(value="/personWithRequestCommittee",method=RequestMethod.POST)
    public @ResponseBody String personWithRequestCommittee(@RequestParam(value="roomId") String data ,HttpServletRequest request,HttpServletResponse response){
        JSONObject room = new JSONObject(data);
        Long roomId = room.getLong("roomId");
        JSONObject allUserRequestCommittee=this.evaluateBoardService.getUserWithRequestCommittee(roomId);
        return allUserRequestCommittee.toString();
    }

    @RequestMapping(value="/setRoleInPaticipants",method=RequestMethod.POST)
    public @ResponseBody String setRoleInPaticipants(@RequestParam(value="paticipantId") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject paticipants=new JSONObject(data);
        String role=paticipants.getString("role");
        if(role.equals("wait")){
            JSONArray paticipantId=paticipants.getJSONArray("paticipantId");
            for(int i=0;i<paticipantId.length();i++){
                this.evaluateBoardService.setRoleInPaticipants(paticipantId.getLong(i),role);
            }
        }else if(role.equals("committee")){
            Long roomId=paticipants.getLong("roomId");
            Long yourId=paticipants.getLong("yourId");
            Long participantId=this.evaluateBoardService.findParticipantId(roomId,yourId);
            this.evaluateBoardService.setRoleInPaticipants(participantId,role);
        }

        return "success";
    }

    @RequestMapping(value="/addModulatorAndUpdateCommittee",method=RequestMethod.POST)
    public @ResponseBody String addModulator(@RequestParam(value="dataApprove") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject paticipants=new JSONObject(data);
        Long roomIdApprove=paticipants.getLong("roomIdApprove");
        Long yourIdApprove=paticipants.getLong("yourIdApprove");
        Long yourIdInRoom=paticipants.getLong("yourIdInRoom");
        this.evaluateBoardService.addModulatorAndUpdateCommittee(roomIdApprove,yourIdApprove,yourIdInRoom);
        return "success";
    }

    @RequestMapping(value="/getallPersonToApprove",method=RequestMethod.POST)
    public @ResponseBody String getallPersonToApprove(@RequestParam(value="roomId") String data,HttpServletRequest request,HttpServletResponse response){
        JSONObject paticipants=new JSONObject(data);
        Long roomId=paticipants.getLong("roomId");
        JSONObject allPersonToApprove=this.evaluateBoardService.getallPersonToApprove(roomId);
        return allPersonToApprove.toString();
    }

}
