package com.spt.evt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spt.evt.entity.Person;

@Controller
public class LoginController {

	@RequestMapping(value="/logIn",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		return new ModelAndView("logIn");

	}

	@RequestMapping(value="/checkUserPassword",method=RequestMethod.POST)
	public @ResponseBody String getUsernamePassword(@RequestParam(value="dataUserAndPassword") String data ,HttpServletRequest arg0,HttpServletResponse arg1) {
		
		System.out.println("================================================="+data);
		JSONObject jsonObj = new JSONObject(data);
		String userName = jsonObj.getString("userName");
		String password = jsonObj.getString("password");
		System.out.println("================================================="+userName+password);
		Map model = new HashMap();
		model.put("userName", userName);
		model.put("password", password);
		return "Success";
	}
}
