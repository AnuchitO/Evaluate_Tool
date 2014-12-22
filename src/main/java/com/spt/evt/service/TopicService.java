package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

public interface TopicService {
	public List<Topic> findBySubject(Subject subject);
	public Topic findById(Long id);
	public String setData(String dataForm);
	public Long deleteDataById(Long id);
	public String editData(String dataForm);
}
