package com.spt.evt.controller;

import static org.hamcrest.core.Is.is;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by : Anuchit Prasertsang 
 * Created Date : 21/10/2014
 */
public class BaseControllerTest extends TemplateTestController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Test
	public void remark() {
		logger.debug("-= Begin test BaseControllerTest() =-");
	}

	@Test
	public void sampleTES() {
		Assert.assertThat("\"sample\"", is("\"sample\""));
	}

}
