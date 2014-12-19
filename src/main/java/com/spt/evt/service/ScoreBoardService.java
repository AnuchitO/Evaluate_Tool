package com.spt.evt.service;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

import java.util.List;

public interface ScoreBoardService {

	public ScoreBoard findByRoomAndCommiteeAndTopicAndExaminer(Room room, Person committee, Topic topic,Person examiner);

	public void save(ScoreBoard scoreBoard);
	
	public void saveOrUpdate(ScoreBoard scoreBoard);

	public List<ScoreBoard> findByRoom(Room room);

	public List<ScoreBoard> findByRoomAndTopicAndExaminer(Room room, Topic topic, Person examiner);

	public List<ScoreBoard> findByTopic(Topic topic);


}
