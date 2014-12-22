package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

public interface SubjectService {
	public List<Subject> findByCourse(Course course);
	public String setData(String dataForm);
	public Long deleteDataById(Long id);
	public Subject findById(Long id);
	public String editData(String dataForm);
}
