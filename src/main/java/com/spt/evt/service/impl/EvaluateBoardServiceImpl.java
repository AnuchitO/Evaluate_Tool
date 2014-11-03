package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.EvaluateBoardService;

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
				
				ScoreBoard scoreBoard = this.getProviderService().getScoreBoardService().findByCommiteeAndTopicAndExaminer(committee, topic, examiner);
				
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

	@Override
	public String scoring(Long committeeId, Long examinerId, Long topicId,Double score, String comment) {
		Person committee = new Person();
		committee.setId(committeeId);

		Topic topic = new Topic();
		topic.setId(topicId);

		Person examiner = new Person();
		examiner.setId(examinerId);
		
		ScoreBoard scoreBoard = new ScoreBoard();
		scoreBoard.setCommittee(committee);
		scoreBoard.setTopic(topic);
		scoreBoard.setExaminer(examiner);
		scoreBoard.setScore(score);
		scoreBoard.setComment(comment);
		
		try {
			this.getProviderService().getScoreBoardService().save(scoreBoard);
		} catch (Exception e) {
			e.printStackTrace();
			return "Scoring Unsuccess";
		}
		
		return "Success";
		
	}

}