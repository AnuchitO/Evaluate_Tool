package com.spt.evt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExaminationRoomController {
	
	@RequestMapping(value="/examinationRoom",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		return new ModelAndView("examinationRoom"); // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

	}

}
