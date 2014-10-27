package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

public interface SubjectDao {
	public List<Subject> findByCourse(Course course);
}
