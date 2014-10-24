package com.spt.evt.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

//@Entity
public class ScoreBoard extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	private Person committee;
	private Topic topic;
	private Person examiner;
	private Double score;
	private String comment;
//
//	@Id
//	@GeneratedValue
//	public Long getId() {
//		return id;
//	}
//
//	@ManyToOne(fetch = FetchType.LAZY)
//	public Person getCommittee() {
//		return committee;
//	}
//
//	@ManyToOne(fetch = FetchType.LAZY)
//	public Topic getTopic() {
//		return topic;
//	}
//
//	public Person getExaminer() {
//		return examiner;
//	}
//
//	public Double getScore() {
//		return score;
//	}
//
//	public String getComment() {
//		return comment;
//	}
//
//	
//	public void setId(Long id) {
//		this.id = id;
//	}
//
//	public void setCommittee(Person committee) {
//		this.committee = committee;
//	}
//
//	public void setTopic(Topic topic) {
//		this.topic = topic;
//	}
//
//	public void setExaminer(Person examiner) {
//		this.examiner = examiner;
//	}
//
//	public void setScore(Double score) {
//		this.score = score;
//	}
//
//	public void setComment(String comment) {
//		this.comment = comment;
//	}

	@Override
	public String toString() {
		return "ScoreBoard [id=" + id + ", committee=" + committee + ", topic="
				+ topic + ", examiner=" + examiner + ", score=" + score
				+ ", comment=" + comment + "]";
	}

}
