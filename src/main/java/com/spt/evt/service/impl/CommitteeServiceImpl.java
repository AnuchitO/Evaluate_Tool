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
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.CommitteeService;
import com.spt.evt.service.CourseService;
import com.spt.evt.service.SubjectService;
import com.spt.evt.service.TopicService;

@Service
public class CommitteeServiceImpl implements CommitteeService {
	private static final Logger logger = LoggerFactory
			.getLogger(CommitteeServiceImpl.class);

	@Autowired
	private CourseService courseService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private TopicService topicService;

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	public SubjectService getSubjectService() {
		return subjectService;
	}

	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	@Override
	public JSONObject getCourseInformation(Long examinerId, Long committeeId,Long courseId) {
		JSONObject courseInformation = new JSONObject();
		Course course = this.getCourseService().findById(courseId);
		List<Subject> subjects = this.getSubjectService().findByCourse(course);

		for (Subject subject : subjects) {
				List<Topic> topics = this.getTopicService().findBySubject(subject);
				for(Topic topic:topics){
					
					logger.error("********* + **** " + topic.getName());
				}
				
		}

		
		return courseInformation;
	}

	public static void main(String[] args) {
		JSONObject course = new JSONObject();

		JSONObject subject = new JSONObject();
		subject.put("id", "2");
		subject.put("name", "java");

		JSONObject topic = new JSONObject();
		topic.put("id", "5");
		topic.put("name", "Declaration & Access control");
		topic.put("description", "C Can declare variable and class in java.");
		subject.append("topic", topic);

		JSONObject topic2 = new JSONObject();
		topic2.put("id", "6");
		topic2.put("name", "Assignments");
		topic2.put("description",
				"B Understand default value of variable, scope of variable wrapper class.");

		subject.append("topic", topic2);

		course.append("subject", subject);

		System.out.println(course.get("subject"));

	}

}