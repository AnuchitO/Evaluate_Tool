package com.spt.evt.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class MemberRegister implements Serializable {

	private Long id;

	private String firstName;

	private String lastName;

	private String gender;

	private String email;

	private String reenterEmail;

	private String password;

	private String reenterPassword;

	private String positionA;

	private String institute;

	private String phoneNumber;

	private String internship;

	private String facebook;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
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

	public String getPositionA() {
		return positionA;
	}

	public void setPositionA(String position) {
		this.positionA = position;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
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

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", Firstname=" + firstName + " Lastname="
				+ lastName + " Gender=" + gender + " Email=" + email
				+ " Re-Email=" + reenterEmail + " Password=" + password
				+ " Re-Password=" + reenterPassword + " Position=" + positionA
				+ " Institute=" + institute + " Phonenumber=" + phoneNumber
				+ " Internship=" + internship + " Facebook=" + facebook + "]";
	}

}
