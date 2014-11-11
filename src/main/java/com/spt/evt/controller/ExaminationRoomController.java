package com.spt.evt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spt.evt.service.EvaluateBoardService;
import com.spt.evt.service.ExaminationRoomService;

@Controller
public class ExaminationRoomController {

	@Autowired
	private ExaminationRoomService examinationRoomService;

	@RequestMapping(value="/examinationRoom",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		String yourId = arg0.getParameter("yourId");
		JSONObject roomInformation = this.examinationRoomService.getRoomInformation();
		Map model = new HashMap();
		model.put("yourId", yourId);
		model.put("room", roomInformation.toString());

		return new ModelAndView("examinationRoom", model);

	}

	@RequestMapping(value="/checkCommittee",method=RequestMethod.POST)
	public @ResponseBody String getUsernamePassword(@RequestParam(value="dataPersonId") String dataPersonId ,HttpServletRequest arg0,HttpServletResponse arg1) {
		JSONObject personDetail = new JSONObject(dataPersonId);
		Long examinerId 	= Long.parseLong(personDetail.getString("examinerId"));
		Long committeeId 	= Long.parseLong(personDetail.getString("committeeId"));
		JSONObject committeeInformation = this.examinationRoomService.getPersonInformation(examinerId,committeeId);

		return committeeInformation.toString();
	}

}
