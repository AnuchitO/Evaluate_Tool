package com.spt.evt.dao;

import static org.hamcrest.core.Is.is;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Base;

/**
 * Created by : Anuchit Prasertsang 
 * Created Date : 21/10/2014
 */
public class BaseDaoTest extends AbstractTestDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Test
	public void remark() {
		logger.debug("-= Begin test BaseDaoTest() =-");
	}

	@Test
	public void testSaveNameShouldBeName() {
		String name = "name";
		Base base = new Base();
		base.setName(name);
		this.getBaseDao().save(base);

		Assert.assertThat(this.getBaseDao().findByName(name).getName(),is(name));
	}

}
