package com.spt.evt.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class ScoreBoard extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room", nullable = false)
	private Room room;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "committee", nullable = false)
	private Person committee;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "topic", nullable = false)
	private Topic topic;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "examiner", nullable = false)
	private Person examiner;

	private Double score;
	private String comment;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Person getCommittee() {
		return committee;
	}

	public void setCommittee(Person committee) {
		this.committee = committee;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Person getExaminer() {
		return examiner;
	}

	public void setExaminer(Person examiner) {
		this.examiner = examiner;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "ScoreBoard [id=" + id + ", room=" + "[room]" + ", committee=" + "[committee]" 
				+ ", topic=" + "[topic]" + ", examiner=" + "[examiner]" + ", score=" + score
				+ ", comment=" + comment + "]";
	}

}
