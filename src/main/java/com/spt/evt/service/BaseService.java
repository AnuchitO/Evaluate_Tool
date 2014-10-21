package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Base;
import com.spt.evt.entity.Booking;
import com.spt.evt.entity.Hotel;

public interface BaseService {

    public List<Base> findAll();

	public void save(Base base);

	public Base findByName(String name);
}

