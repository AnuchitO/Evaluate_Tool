package com.spt.evt.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spt.evt.entity.Base;
import com.spt.evt.entity.Booking;
import com.spt.evt.entity.Hotel;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.BookingService;
import com.spt.evt.utils.AjaxUtils;

@Controller
public class BaseController {
	private static final Logger logger = LoggerFactory
			.getLogger(BaseController.class);

	@Autowired
	private BaseService baseService;

	public BaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}

	@RequestMapping(value = "/base/{id}", method = RequestMethod.GET)
	public String base(@PathVariable Long id) {
		logger.info("base()");
		return "hotels/show";
	}

	@RequestMapping(value = "/ajaxtest", method = RequestMethod.POST)
	public @ResponseBody
	String getAjax(
			@RequestParam(value = "first", required = false) String first,
			@RequestParam(value = "name", required = false) String name) {
		logger.info(" getAjax()  first : " + first + " name : " + name);

		Base base = new Base();
		base.setName("Base");
		this.baseService.save(base);

		List<Base> result = this.baseService.findAll();

		logger.info("Result  ::: " + result.toString());
		return "Successful";
	}

}