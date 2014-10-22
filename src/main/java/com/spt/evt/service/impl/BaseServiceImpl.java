package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.entity.Base;
import com.spt.evt.service.BaseService;

@Service
public class BaseServiceImpl implements BaseService {
	private static final Logger logger = LoggerFactory.getLogger(BaseServiceImpl.class);
	
	@Autowired
	private BaseDao baseDao;

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public List<Base> findAll() {		
		return this.baseDao.findAll();
	}

	@Override
	public void save(Base base) {
		this.baseDao.save(base);	
	}

	public Base findByName(String name){
		return this.getBaseDao().findByName(name);
	}

}