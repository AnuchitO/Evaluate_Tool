package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Base;
import com.spt.evt.entity.Booking;

public interface BaseDao {
	public List<Base> findAll();

	public void save(Base base);

	public Base findByName(String name);

}
