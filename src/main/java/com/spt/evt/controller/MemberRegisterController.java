package com.spt.evt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spt.evt.service.MemberRegisterService;

@Controller
public class MemberRegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberRegisterController.class);
	
	@Autowired
	private MemberRegisterService memberRegisterService;

	public MemberRegisterService getMemberRegisterService() {
		return memberRegisterService;
	}

	public void setMemberRegisterService(MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}

	@RequestMapping(value="/memberregister",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		return new ModelAndView("memberregister"); // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

	}
	
	@RequestMapping(value="/memberregister", method = RequestMethod.POST)
	public @ResponseBody String post(@RequestParam(value="dataForm") String dataForm) {
		//logger.info("You In Controller Haha "+data);
		memberRegisterService.setData(dataForm);
		System.out.println("DATA"+dataForm);
		return "Seccessful";
	}

}
