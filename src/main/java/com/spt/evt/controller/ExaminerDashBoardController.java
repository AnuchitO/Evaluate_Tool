package com.spt.evt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExaminerDashBoardController {
	
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

}
