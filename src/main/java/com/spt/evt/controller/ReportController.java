package com.spt.evt.controller;

import java.util.HashMap;
import java.util.List;
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

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.service.ReportService;
import com.spt.evt.service.impl.ReportServiceImpl;

@Controller
public class ReportController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	private ReportService reportService;

	@RequestMapping(value="/report",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String yourId = request.getParameter("yourId");
		JSONObject completeRoomInformation = this.reportService.getAllScore();
		Map model = new HashMap();
		model.put("yourId", yourId);
		model.put("completeRoom", completeRoomInformation.toString());

		return new ModelAndView("report",model);
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

}
