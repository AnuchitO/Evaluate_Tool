package com.spt.evt.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Topic extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;
	private String name;
	private String description;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subject", nullable = false)
	private Subject subject;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "topic")
	private Set<ScoreBoard> scoreBoards = new HashSet<ScoreBoard>();

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

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Set<ScoreBoard> getScoreBoards() {
		return scoreBoards;
	}

	public void setScoreBoards(Set<ScoreBoard> scoreBoards) {
		this.scoreBoards = scoreBoards;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", name=" + name + ", description="
				+ description + ", subject=" + "Set<[subject]>" + ", scoreBoards="
				+ "Sets<[coreBoards]>" + "]";
	}

}
