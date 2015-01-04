package com.spt.evt.dao;

import com.spt.evt.entity.Room;

import java.util.List;

public interface RoomDao {
	public List<Room> findAll();
	public Room findById(Long id);
	public List<Room> findByStatus(String status);
	public void setStatusByRoom(Room room);
    public void setStatusRoomReady(Long roomId);
    public void setAddRoom(Room dataroom);
	public void setRemoveRoom(Long roomid);
	public void editRoom(Room dataroom);
    public void setStatusRoomTerminate(Long idRoom);
}
