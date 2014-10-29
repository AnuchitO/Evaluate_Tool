package com.spt.evt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spt.evt.service.CourseService;

@Controller
public class EvaluateBoardController {
	
//	@Autowired
//	private CourseService courseService;
//	
//	public CourseService getCourseService() {
//		return courseService;
//	}
//	
//	public void setCourseService(CourseService courseService) {
//		this.courseService = courseService;
//	}

	@RequestMapping(value="/evaluateBoard",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		
		
		return new ModelAndView("evaluateBoard"); // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

	}
	
}
