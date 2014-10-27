package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

public interface TopicDao {
	public List<Topic> findBySubject(Subject subject);
}
