package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.RoomDao;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.EvaluateBoardService;

@Service
public class EvaluateBoardServiceImpl extends ProviderService implements EvaluateBoardService {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EvaluateBoardServiceImpl.class);
	
	@Override
	public JSONObject getCourseInformation(Long roomId, Long examinerId, Long committeeId,Long courseId) {

		JSONObject courseInformation = new JSONObject();
		Room room			= this.getRoomService().findById(roomId);
		Person committee 	= this.getPersonService().findById(committeeId);
		Person examiner 	= this.getPersonService().findById(examinerId);
		Course course 		= this.getCourseService().findById(courseId);

		List<Subject> subjects = this.getSubjectService().findByCourse(course);

		JSONObject subjectElement = null;
		for (Subject subject : subjects) {
			subjectElement = new JSONObject();
			subjectElement.put("id", subject.getId());
			subjectElement.put("name",subject.getName());

			List<Topic> topics = this.getTopicService().findBySubject(subject);
			findScoreAddIntoJsonOfTopic(room, committee, examiner, subjectElement, topics);

			courseInformation.append("subject", subjectElement);
		}
		return courseInformation;
	}

	private void findScoreAddIntoJsonOfTopic(Room room, Person committee, Person examiner,	JSONObject subjectElement, List<Topic> topics) {
		for (Topic topic : topics) {
			JSONObject topicElement = new JSONObject();
			topicElement.put("id",topic.getId());
			topicElement.put("name",topic.getName());
			topicElement.put("description",topic.getDescription());

			ScoreBoard scoreBoard = this.getScoreBoardService().findByRoomAndCommiteeAndTopicAndExaminer(room, committee, topic, examiner);
			
			if(null!=scoreBoard){
				topicElement.put("score",scoreBoard.getScore());
				topicElement.put("comment",scoreBoard.getComment());
			}else{
				topicElement.put("score","-");
				topicElement.put("comment","");
			}

			subjectElement.append("topic", topicElement);
		}
	}

	@Override
	public String scoring(Long roomId, Long committeeId, Long examinerId, Long topicId,Double score, String comment) {
		Room room = new Room();
		room.setId(roomId);

		Person committee = new Person();
		committee.setId(committeeId);

		Topic topic = new Topic();
		topic.setId(topicId);

		Person examiner = new Person();
		examiner.setId(examinerId);

		ScoreBoard scoreBoard = new ScoreBoard();
		scoreBoard.setRoom(room);
		scoreBoard.setCommittee(committee);
		scoreBoard.setTopic(topic);
		scoreBoard.setExaminer(examiner);
		scoreBoard.setScore(score);
		scoreBoard.setComment(comment);

		try {
			ScoreBoard scoreBoardOld = this.getScoreBoardService().findByRoomAndCommiteeAndTopicAndExaminer(room, committee, topic, examiner);
			if(null!=scoreBoardOld){
				scoreBoardOld.setRoom(room);
				scoreBoardOld.setCommittee(committee);
				scoreBoardOld.setTopic(topic);
				scoreBoardOld.setExaminer(examiner);
				scoreBoardOld.setScore(score);
				scoreBoardOld.setComment(comment);
				this.getScoreBoardService().saveOrUpdate(scoreBoardOld);
			}

			this.getScoreBoardService().saveOrUpdate(scoreBoard);
		} catch (Exception e) {
			e.printStackTrace();
			return "Scoring Unsuccess";
		}

		return "Success";

	}

	@Override
	public String getCourseName(Long courseId) {
		Course course 		= this.getCourseService().findById(courseId);
		String courseName = course.getDescription();
		return courseName;
	}

	@Override
	public void setStatusRoom(Long roomId) {
		Room room = this.getRoomService().findById(roomId);
		this.getRoomService().setStatusRoom(room);
	}

}