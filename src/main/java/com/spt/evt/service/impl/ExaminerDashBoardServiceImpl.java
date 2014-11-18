package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.spt.evt.entity.Course;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.ExaminerDashBoardService;

@Service
public class ExaminerDashBoardServiceImpl extends ProviderService implements ExaminerDashBoardService {

	@Override
	public JSONObject getCourseInformation(Long courseId) {
		JSONObject courseInformation = new JSONObject();
		Course course 		= this.getCourseService().findById(courseId);
		List<Subject> subjects = this.getSubjectService().findByCourse(course);
		JSONObject subjectElement = null;
		for (Subject subject : subjects) {
			subjectElement = new JSONObject();
			subjectElement.put("id", subject.getId());
			subjectElement.put("name",subject.getName());

			List<Topic> topics = this.getTopicService().findBySubject(subject);
			for (Topic topic : topics) {
				JSONObject topicElement = new JSONObject();
				topicElement.put("id",topic.getId());
				topicElement.put("name",topic.getName());
				topicElement.put("description",topic.getDescription());

				subjectElement.append("topic", topicElement);
			}

			courseInformation.append("subject", subjectElement);
		}
		return courseInformation;
	}

}
