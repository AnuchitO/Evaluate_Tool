package com.spt.evt.dao;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

public interface ScoreBoardDao {
	public ScoreBoard findByCommiteeAndTopic(Person committee,Topic topic,Person examiner);
}
