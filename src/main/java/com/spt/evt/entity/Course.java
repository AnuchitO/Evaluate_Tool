package com.spt.evt.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Course extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @GenericGenerator(name="aaa",strategy="increment")
    @GeneratedValue(generator="aaa")
	private Long id;
	private String name;
	private String description;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	private Set<Subject> subjects = new HashSet<Subject>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	private Set<Enroll> enrolls = new HashSet<Enroll>();

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

	public Set<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(Set<Subject> subjects) {
		this.subjects = subjects;
	}

	public Set<Enroll> getEnrolls() {
		return enrolls;
	}

	public void setEnrolls(Set<Enroll> enrolls) {
		this.enrolls = enrolls;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", description="
				+ description + ", subjects=" + "Set<subject>" + ", enrolls="
				+ "Set<enrolls>" + "]";
	}

}
