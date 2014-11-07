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
public class ExaminerDashBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EvaluateBoardController.class);
//	@Autowired
//	private ExaminerDashBoardService examinerDashBoardService;

	@RequestMapping(value="/examinerDashBoard",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		return new ModelAndView("examinerDashBoard"); // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

	}

	@RequestMapping(value="/exam",method=RequestMethod.GET)
	public ModelAndView getData(@RequestParam(value="subject") String subject,@RequestParam(value="title") String title,@RequestParam(value="detail") String detail, HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		Map model = new HashMap();
		model.put("subject", subject);
		model.put("title", title);
		model.put("detail", detail );
		return new ModelAndView("evaluateBoard",model);
	}

	//	@RequestMapping(value="/examiner",method=RequestMethod.POST)
	//	public @ResponseBody String receiveCourseData(@RequestParam(value="data") String data ,HttpServletRequest arg0,
	//			HttpServletResponse arg1)  {
	//		JSONObject courseDetail = new JSONObject(data);
	//		Long examinerId 	= Long.parseLong(courseDetail.getString("examinerId"));
	//		Long committeeId 	= Long.parseLong(courseDetail.getString("committeeId"));		
	//		Long courseId 		= Long.parseLong(courseDetail.getString("courseId"));
	//
	//		JSONObject courseInformation = this.examinerDashBoardService.getCourseInformation(examinerId,committeeId , courseId);
	//
	//		return courseInformation.toString();
	//
	//	}

}
