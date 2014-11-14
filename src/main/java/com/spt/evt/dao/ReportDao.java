package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Room;

public interface ReportDao {
	public List<Room> findByStatus();
}
