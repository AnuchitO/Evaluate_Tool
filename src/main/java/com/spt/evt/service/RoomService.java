package com.spt.evt.service;

import com.spt.evt.entity.Room;

import java.util.List;

public interface RoomService {
	public List<Room> findAll();
	public Room findById(Long id);
	public List<Room> findByStatus(String status);
	public void setStatusRoom(Room room);
    public void setStatusRoomReady(Long roomId);
    public void addRoom(Room data);
	public void removeRoom(Long roomLongId);
	public void editRoom(Room data);
}
