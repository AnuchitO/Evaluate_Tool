package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

public interface TopicDao {
	public Topic findById(Long id);
	public List<Topic> findBySubject(Subject subject);
	public void persist(Topic topic);
	public void removeTopic(Topic topic);
	public void update(Topic topic);
}
