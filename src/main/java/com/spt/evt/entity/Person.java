package com.spt.evt.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Person extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;
	private String name;
	private String lastName;
	private String gender;
	private String email;
	private Date birthDay;
	private String phone;
	private String positionName;
	private String userName;
	private String password;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "person")
	private Set<Enroll> enrolls = new HashSet<Enroll>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "person")
	private Set<Participant> participants = new HashSet<Participant>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "committee")
	private Set<ScoreBoard> committee = new HashSet<ScoreBoard>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "examiner")
	private Set<ScoreBoard> examiner = new HashSet<ScoreBoard>();

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

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Set<Enroll> getEnrolls() {
		return enrolls;
	}

	public void setEnrolls(Set<Enroll> enrolls) {
		this.enrolls = enrolls;
	}

	public Set<Participant> getParticipants() {
		return participants;
	}

	public void setParticipants(Set<Participant> participants) {
		this.participants = participants;
	}

	public Set<ScoreBoard> getCommittee() {
		return committee;
	}

	public void setCommittee(Set<ScoreBoard> committee) {
		this.committee = committee;
	}

	public Set<ScoreBoard> getExaminer() {
		return examiner;
	}

	public void setExaminer(Set<ScoreBoard> examiner) {
		this.examiner = examiner;
	}

	@Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", lastName=" + lastName
				+ ", gender=" + gender + ", email=" + email + ", birthDay="
				+ birthDay + ", phone=" + phone + ", positionName="
				+ positionName + ", enrolls=" + "[enrolls]" + ", participants="
				+ "[participants]" + ", committee=" + "[committee]"+ ", examiner=" + "[examiner]" + "]";
	}

}
