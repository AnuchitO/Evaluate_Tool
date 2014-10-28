package com.spt.evt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommitteeController {
	
	private String examinerId;
	private String committeeId;
	private String subject;
	private String title;
	private String detail;
	
	@RequestMapping(value="/committeeBoard",method=RequestMethod.POST)
	public String view(@RequestParam(value="data") String data ,HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		
		System.out.println(data);
		return null; // ชื่อของ tile ที่เรา definition ในไฟล์ tiles.xml

	}
	
	public String getExaminer() {
		return examinerId;
	}
	public void setExaminer(String examiner) {
		this.examinerId = examiner;
	}
	public String getCommittee() {
		return committeeId;
	}
	public void setCommittee(String committee) {
		this.committeeId = committee;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}

}
