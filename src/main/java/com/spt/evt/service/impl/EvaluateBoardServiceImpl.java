package com.spt.evt.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.entity.Base;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.EvaluateBoardService;
import com.spt.evt.service.CourseService;
import com.spt.evt.service.ScoreBoardService;
import com.spt.evt.service.SubjectService;
import com.spt.evt.service.TopicService;

@Service
public class EvaluateBoardServiceImpl implements EvaluateBoardService {
	private static final Logger logger = LoggerFactory
			.getLogger(EvaluateBoardServiceImpl.class);

	@Autowired
	private ProviderService providerService;

	public ProviderService getProviderService() {
		return providerService;
	}

	public void setProviderService(ProviderService providerService) {
		this.providerService = providerService;
	}

	@Override
	public JSONObject getCourseInformation(Long examinerId, Long committeeId,Long courseId) {
		
		JSONObject courseInformation = new JSONObject();
		
		Person committee = this.getProviderService().getPersonService().findById(committeeId);
		Person examiner = this.getProviderService().getPersonService().findById(examinerId);
		Course course = this.getProviderService().getCourseService().findById(courseId);
		List<Subject> subjects = this.getProviderService().getSubjectService().findByCourse(course);

		JSONObject subjectElement = null;
		for (Subject subject : subjects) {
			subjectElement = new JSONObject();
			subjectElement.put("id", subject.getId());
			subjectElement.put("name",subject.getName());
			
			List<Topic> topics = this.getProviderService().getTopicService().findBySubject(subject);
			for (Topic topic : topics) {
				JSONObject topicElement = new JSONObject();
				topicElement.put("id",topic.getId());
				topicElement.put("name",topic.getName());
				topicElement.put("description",topic.getDescription());
				
				ScoreBoard scoreBoard = this.getProviderService().getScoreBoardService().findByCommiteeAndTopic(committee, topic, examiner);
				
				if(null!=scoreBoard){
					topicElement.put("score",scoreBoard.getScore());
				}else{
					topicElement.put("score","-");
				}
				
				subjectElement.append("topic", topicElement);
			}
			
			courseInformation.append("subject", subjectElement);
		}
		return courseInformation;
	}

}