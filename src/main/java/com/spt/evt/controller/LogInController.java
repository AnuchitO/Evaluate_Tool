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

import com.spt.evt.service.LogInService;
import com.spt.evt.service.impl.LogInServiceImpl;

@Controller
public class LogInController {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(LogInController.class);
	
	@Autowired
	private LogInService logInService;

	@RequestMapping(value="/logIn",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		return new ModelAndView("logIn");

	}

	@RequestMapping(value="/checkUserPassword",method=RequestMethod.POST)
	public @ResponseBody String getUsernamePassword(@RequestParam(value="dataUserAndPassword") String dataUserAndPassword ,HttpServletRequest arg0,HttpServletResponse arg1) {

		JSONObject userNamePassword = new JSONObject(dataUserAndPassword);
		String userName = userNamePassword.getString("userName");
		String password = userNamePassword.getString("password");
		JSONObject sendUserNamePassword = this.logInService.checkUserNamePassword(userName,password);

		return sendUserNamePassword.toString();
	}
}
