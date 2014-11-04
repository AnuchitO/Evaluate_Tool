package com.spt.evt.service;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

public interface ScoreBoardService {

	public ScoreBoard findByCommiteeAndTopicAndExaminer(Person committee, Topic topic,Person examiner);

	public void save(ScoreBoard scoreBoard);
	
	public void saveOrUpdate(ScoreBoard scoreBoard);

}
