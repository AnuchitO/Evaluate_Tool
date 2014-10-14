package com.spt.evt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="memberRegister")
public class MemberRegister {

	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;

	@Column(name="firstName")
	private String firstName;

	@Column(name="lastName")
	private String lastName;

	@Column(name="gender")
	private String gender;
	
	@Column(name="email")
	private String email;

	@Column(name="reenterEmail")
	private String reenterEmail;

	@Column(name="password")
	private String password;

	@Column(name="reenterPassword")
	private String reenterPassword;

	@Column(name="position")
	private String position;

	@Column(name="institute")
	private String institute;

	@Column(name="phoneNumber")
	private Integer phoneNumber;

	@Column(name="internship")
	private String internship;

	@Column(name="facebook")
	private String facebook;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
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

	public String getReenterEmail() {
		return reenterEmail;
	}

	public void setReenterEmail(String reenterEmail) {
		this.reenterEmail = reenterEmail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getReenterPassword() {
		return reenterPassword;
	}

	public void setReenterPassword(String reenterPassword) {
		this.reenterPassword = reenterPassword;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public Integer getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Integer phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getInternship() {
		return internship;
	}

	public void setInternship(String internship) {
		this.internship = internship;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

}
