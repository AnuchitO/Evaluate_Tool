package com.spt.evt.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Participants extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GenericGenerator(name="aaa",strategy="increment")
    @GeneratedValue(generator="aaa")
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "person", nullable = false)
	private Person person;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "room", nullable = false)
	private Room room;

	private String role;

	private Boolean modulator;

    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Boolean getModulator() {
		return modulator;
	}

	public void setModulator(Boolean modulator) {
		this.modulator = modulator;
	}

	@Override
	public String toString() {
		return "Participant [id=" + id + ", person=" + "[person]" + ", room="
				+ "[room]" + ", role=" + "[role]" + ", modulator =" + "[modulator]" +"]";
	}

}
