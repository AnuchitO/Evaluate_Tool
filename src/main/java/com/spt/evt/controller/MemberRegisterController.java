package com.spt.evt.controller;

import java.util.List;

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

import com.spt.evt.entity.MemberRegister;
import com.spt.evt.service.MemberRegisterService;

@Controller
public class MemberRegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberRegisterController.class);
	
	@Autowired
	private MemberRegisterService memberRegisterService;

	@RequestMapping(value="/memberRegister",method=RequestMethod.GET)
	public ModelAndView handleGetRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		return new ModelAndView("memberRegister"); // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

	}
	
	@RequestMapping(value="/memberRegister", method = RequestMethod.POST)
	public @ResponseBody String post(@RequestParam(value="dataForm") String dataForm) {
		memberRegisterService.setData(dataForm);
		System.out.println("DATA"+dataForm);
		List<MemberRegister> result = this.memberRegisterService.findAll();
		logger.info("Result  ::: " + result.toString());
		
		return "Seccessful";
	}

}
