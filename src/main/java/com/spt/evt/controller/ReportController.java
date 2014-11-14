package com.spt.evt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spt.evt.entity.Room;
import com.spt.evt.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/report",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		JSONObject roomInformation = this.reportService.findByStatus();
		
		Map model = new HashMap();
		model.put("room", roomInformation.toString());
		//JSONObject roomInformation = this.reportService.findByStatus();
		//System.out.println("=====Controller===="+model);
		return new ModelAndView("report",model);

	}
	
}
