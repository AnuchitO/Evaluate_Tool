package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

public interface TopicService {
	public List<Topic> findBySubject(Subject subject);
	public Topic findById(Long id);
}
