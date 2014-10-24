package com.spt.evt.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Participant extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	private Person person;
	private Room room;
	private String role;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	
	public Person getPerson() {
		return person;
	}

	public Room getRoom() {
		return room;
	}

	public String getRole() {
		return role;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Participant [id=" + id + ", person=" + person + ", room="
				+ room + ", role=" + role + "]";
	}

}
