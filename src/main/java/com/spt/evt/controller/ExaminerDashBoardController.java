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
import com.spt.evt.service.ExaminerDashBoardService;

@Controller
public class ExaminerDashBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EvaluateBoardController.class);

	@Autowired
	private ExaminerDashBoardService examinerDashBoardService;

	@RequestMapping(value="/examinerDashBoard",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String idRoom = request.getParameter("idRoom");
		String idCourse = request.getParameter("idCourse");
		String idExaminer = request.getParameter("idExaminer");
		String yourId = request.getParameter("yourId");
		String yourPosition = request.getParameter("yourPosition");
		Map model = new HashMap();
		model.put("idRoom", idRoom);
		model.put("idCourse", idCourse);
		model.put("idExaminer", idExaminer);
		model.put("yourId", yourId);
		model.put("yourPosition", yourPosition);

		return new ModelAndView("examinerDashBoard",model);

	}

	@RequestMapping(value="/examinerDashBoardTopicList",method=RequestMethod.POST)
	public @ResponseBody String receiveCourseData(@RequestParam(value="data") String data ,HttpServletRequest arg0,
			HttpServletResponse arg1)  {
		JSONObject courseDetail = new JSONObject(data);	
		Long courseId 		= Long.parseLong(courseDetail.getString("courseId"));
		JSONObject courseInformation = this.examinerDashBoardService.getCourseInformation(courseId);
		return courseInformation.toString();

	}

	@RequestMapping(value="/test",method=RequestMethod.POST)
	public @ResponseBody String test(@RequestParam(value="data") String data ,HttpServletRequest arg0,
			HttpServletResponse arg1)  {
		
		LOGGER.debug("Can go to Controller");
		return null;
	}

}
