package com.spt.evt.controller;

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
	private static final Logger logger = LoggerFactory.getLogger(EvaluateBoardController.class);
	@Autowired
	private EvaluateBoardService evaluateBoardService;

	@RequestMapping(value="/evaluateBoard",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		System.out.println("*************************** evaluateBoard  *****************");
		//String committee = "P'aod";
		//String examiner = "Patipol";
		return new ModelAndView("evaluateBoard");

	}

	@RequestMapping(value="/evaluateBoardTopicList",method=RequestMethod.POST)
	public @ResponseBody String receiveCourseData(@RequestParam(value="data") String data ,HttpServletRequest arg0,
			HttpServletResponse arg1)  {
		JSONObject jsonObj = new JSONObject(data);
		JSONObject courseInformation = this.evaluateBoardService.getCourseInformation(Long.parseLong(jsonObj.getString("examinerId")), Long.parseLong(jsonObj.getString("committeeId")), Long.parseLong(jsonObj.getString("courseId")));

		return courseInformation.toString();

	}

	@RequestMapping(value="/scoring",method=RequestMethod.POST)
	public @ResponseBody String scoring(@RequestParam(value="data") String data ,HttpServletRequest arg0,HttpServletResponse arg1) {
		JSONObject jsonObj = new JSONObject(data);		
		Long examinerId = jsonObj.getLong("examinerId");
		Long committeeId = jsonObj.getLong("committeeId");
		Long topicId =  jsonObj.getLong("topicId");
		Double score =  jsonObj.getDouble("score");
		String comment = jsonObj.getString("comment");

		logger.debug("Scoring ******************************************* : {}",jsonObj.toString());
		String status = this.evaluateBoardService.scoring(committeeId, examinerId, topicId, score, comment);

		return status;
	}

}
