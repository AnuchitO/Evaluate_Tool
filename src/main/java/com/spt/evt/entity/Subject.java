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
public class Subject extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private String description;
	private Course course;
	private Set<Topic> topics = new HashSet<Topic>(0);

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}


	@ManyToOne(fetch = FetchType.LAZY)// join
	@JoinColumn(name = "course", nullable = false)
	public Course getCourse() {
		return course;
	}

	@OneToMany(fetch = FetchType.LAZY)
	public Set<Topic> getTopics() {
		return topics;
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

	public void setCourse(Course course) {
		this.course = course;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	@Override
	public String toString() {
		return "Subject [id=" + id + ", name=" + name + ", description="
				+ description + ", course=" + course + "]";
	}

}
