package com.spt.evt.service;

import com.spt.evt.entity.Course;
import org.json.JSONObject;


public interface CourseService {
	public Course findById(Long id);
	public String setData(String dataForm);
	public JSONObject getAllCourse();
	public Long deleteDataById(Long id);
	public String editData(String dataForm);
}
