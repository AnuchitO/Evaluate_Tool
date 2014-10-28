package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

public interface SubjectService {
	public List<Subject> findByCourse(Course course);
}
