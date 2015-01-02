package com.spt.evt.controller;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.service.ParticipantsService;
import com.spt.evt.service.PersonService;
import com.spt.evt.service.ReportService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReportController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	private ReportService reportService;
	@Autowired
	private ParticipantsService participantsService;
	@Autowired
	private PersonService personService;


	@RequestMapping(value="/report",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String yourId = request.getParameter("yourId");
		String name = request.getParameter("yourName");
		String lastName = request.getParameter("yourLastName");
		String yourPosition = request.getParameter("yourPosition");
		JSONObject completeRoomInformation = this.reportService.getAllExaminerCompleted();
		Map model = new HashMap();
		model.put("yourId", yourId);
		model.put("name", name);
		model.put("lastName", lastName);
		model.put("yourPosition", yourPosition);
		model.put("completeRoom", completeRoomInformation.toString());
		return new ModelAndView("report",model);
	}

	@RequestMapping(value="/summaryByTopic",method=RequestMethod.GET)
	public ModelAndView handleGetRequestSummary(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String yourId = request.getParameter("yourId");
		String name = request.getParameter("yourName");
		String lastName = request.getParameter("yourLastName");
		String yourPosition = request.getParameter("yourPosition");
		String courseId = request.getParameter("courseId");
		JSONObject completeRoomInformation = this.reportService.getAllScore();
		Map model = new HashMap();
		model.put("yourId", yourId);
		model.put("name", name);
		model.put("lastName", lastName);
		model.put("yourPosition", yourPosition);
		model.put("completeRoom", completeRoomInformation.toString());
		model.put("courseId",courseId);
		return new ModelAndView("summaryByTopic",model);
	}

	@RequestMapping(value="/getroomscore",method=RequestMethod.POST)
	public @ResponseBody String getRoomScore(@RequestParam(value="examinerId") String examinerId ,HttpServletRequest arg0,HttpServletResponse arg1) {
		JSONObject examinerDetail = new JSONObject(examinerId);
		String id = examinerDetail.getString("id");
		if(id.equals("null")) {
			examinerDetail = this.reportService.getAllScore();
		}
		else{
			Long examiner_Id = Long.parseLong(examinerDetail.getString("id"));
			Person personDetail = this.reportService.getPersonByExaminerId(examiner_Id);
			examinerDetail = this.reportService.getScoreByExaminer(personDetail);
		}
		return examinerDetail.toString();
	}

	@RequestMapping(value="/getRoomName",method=RequestMethod.POST)
	public @ResponseBody String getRoomName(@RequestParam(value="personId") Long personId ,HttpServletRequest arg0,HttpServletResponse arg1) {

		Person person = personService.findById(personId);
		JSONObject personJsonResult = new JSONObject();
		JSONObject personJson = null;
		List<Participants> participants = participantsService.findByPerson(person);
		DateFormat formatDate = new SimpleDateFormat("yyyy/MM/dd");

		for (Participants ob:participants) {
			personJson = new JSONObject();
			personJson.put("courseId",ob.getRoom().getCourseId());
			personJson.put("roomId",ob.getRoom().getId());
			personJson.put("roomName",ob.getRoom().getName());
			personJson.put("startTime",formatDate.format(ob.getRoom().getStartTime()));
			personJsonResult.append("data",personJson);
		}

		return personJsonResult.toString();
	}

	@RequestMapping(value="/summaryTopicList",method=RequestMethod.POST)
	public @ResponseBody String receiveCourseData(@RequestParam(value="data") String data ,HttpServletRequest arg0,
			HttpServletResponse arg1)  {
		JSONObject courseDetail = new JSONObject(data);

		Long roomId			= Long.parseLong(courseDetail.getString("roomId"));
		Long examinerId 	= Long.parseLong(courseDetail.getString("examinerId"));
		Long committeeId 	= Long.parseLong(courseDetail.getString("committeeId"));
		Long courseId 		= Long.parseLong(courseDetail.getString("courseId"));

		JSONObject courseInformation = this.reportService.getCourseInformationSummary(roomId,examinerId,committeeId , courseId);
		return courseInformation.toString();

	}
	@RequestMapping(value="/exportExcel",method=RequestMethod.GET)
	public ModelAndView excelView(HttpServletRequest request,HttpServletResponse response)  {

		Long roomId			= Long.parseLong(request.getParameter("roomId"));
		Long examinerId 	= Long.parseLong(request.getParameter("examinerId"));
		Long committeeId 	= Long.parseLong(request.getParameter("committeeId"));
		Long courseId 		= Long.parseLong(request.getParameter("courseId"));

		JSONObject courseInformation = this.reportService.getCourseInformationSummary(roomId, examinerId, committeeId, courseId);
		JSONObject completeRoomInformation = this.reportService.getAllScore();
		JSONArray getReport = (JSONArray) completeRoomInformation.get("report");
		JSONObject getAverageScore = null;

		for (int i=0;i<getReport.length();i++){
			getAverageScore = (JSONObject) getReport.get(i);
			LOGGER.debug("examinerId :: "+getAverageScore.get("examinerId"));

			if (examinerId == Long.parseLong(getAverageScore.get("examinerId").toString())){
				courseInformation.put("averageScore", getAverageScore.get("averageAllScore"));
			}
		}
		return new ModelAndView("excelView","score",courseInformation);
	}


}
