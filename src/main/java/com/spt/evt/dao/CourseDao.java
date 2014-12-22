package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;

public interface CourseDao {
	public Course findById(Long id);
	public void persist(Course course);
	public List<Course> findAll();
	public void removeCourse(Course course);
	public void update(Course course);
}
