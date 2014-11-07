package com.spt.evt.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Room extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;
	private String name;
	private String description;
	private String examiner;
	private String modulator;
	private String status;


	@OneToMany(fetch = FetchType.LAZY, mappedBy = "room")
	private Set<Participant> participants = new HashSet<Participant>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExaminer() {
		return examiner;
	}

	public void setExaminer(String examiner) {
		this.examiner = examiner;
	}

	public String getModulator() {
		return modulator;
	}

	public void setModulator(String modulator) {
		this.modulator = modulator;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Set<Participant> getParticipants() {
		return participants;
	}

	public void setParticipants(Set<Participant> participants) {
		this.participants = participants;
	}

	@Override
	public String toString() {
		return "Room [id=" + id + ", name=" + name + ", description="
				+ description + "examiner=" + examiner + "modulator=" 
				+ modulator + "status=" + status + ", participants=" + "[participants]" + "]";
	}

}
