package com.spt.evt.service;

import static org.hamcrest.core.Is.is;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Base;

/**
 * Created by : Anuchit Prasertsang Created Date : 21/10/2014
 */
public class BaseServiceTest extends AbstractTestService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BaseService baseService;

	public BaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}

	@Test
	public void remark() {
		logger.debug("-= Begin test BaseServiceTest() =-");
	}

	@Test
	public void testSaveNameShouldBeName() {
		String name = "name";
		Base base = new Base();
		base.setName(name);
		this.getBaseService().save(base);
		Assert.assertThat(this.getBaseService().findByName(name).getName(),is(name));
	}

}
