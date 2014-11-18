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
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		String idRoom = arg0.getParameter("idRoom");
		String idCourse = arg0.getParameter("idCourse");
		String idExaminer = arg0.getParameter("idExaminer");
		Map model = new HashMap();
		model.put("idRoom", idRoom);
		model.put("idCourse", idCourse);
		model.put("idExaminer", idExaminer);

		return new ModelAndView("examinerDashBoard",model); // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

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
