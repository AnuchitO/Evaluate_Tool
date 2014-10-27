package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

public interface CourseDao {
	public Course findById(Long id);
}
