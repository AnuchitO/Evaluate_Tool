package com.spt.evt.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.dao.BookingDao;
import com.spt.evt.dao.impl.JpaBookingDaoImpl;
import com.spt.evt.dto.SearchCriteria;
import com.spt.evt.entity.Base;
import com.spt.evt.entity.Booking;
import com.spt.evt.entity.Hotel;
import com.spt.evt.entity.User;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.BookingService;

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


}