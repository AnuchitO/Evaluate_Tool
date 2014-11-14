package com.spt.evt.dao;

import java.util.List;
import java.util.Set;

import com.spt.evt.entity.Room;

public interface RoomDao {
	public List<Room> findAll();
	public Room findById(Long id);
}
