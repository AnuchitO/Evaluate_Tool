package com.spt.evt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView handleGetRequest(HttpServletRequest arg0,HttpServletResponse arg1) throws Exception {
		String idRoom = arg0.getParameter("idRoom");
		String idCourse = arg0.getParameter("idCourse");
		String nameCourse = arg0.getParameter("nameCourse");
		String idExaminer = arg0.getParameter("idExaminer");
		String nameExaminer = arg0.getParameter("nameExaminer");
		String lastNameExaminer = arg0.getParameter("lastNameExaminer");
		String idCommittee = arg0.getParameter("idCommittee");
		String nameCommittee = arg0.getParameter("nameCommittee");
		String lastNameCommittee = arg0.getParameter("lastNameCommittee");
		Map model = new HashMap();
		model.put("idRoom", idRoom);
		model.put("idCourse", idCourse);
		model.put("nameCourse", nameCourse);
		model.put("idExaminer", idExaminer);
		model.put("nameExaminer", nameExaminer);
		model.put("lastNameExaminer", lastNameExaminer);
		model.put("idCommittee", idCommittee);
		model.put("nameCommittee", nameCommittee);
		model.put("lastNameCommittee", lastNameCommittee);
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

}
