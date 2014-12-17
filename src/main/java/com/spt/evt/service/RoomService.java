package com.spt.evt.service;

import java.util.List;
import java.util.Set;

import com.spt.evt.entity.Room;

public interface RoomService {
	public List<Room> findAll();
	public Room findById(Long id);
	public List<Room> findByStatus(String status);
	public void setStatusRoom(Room room);
    public void setStatusRoomReady(Long roomId);

}
