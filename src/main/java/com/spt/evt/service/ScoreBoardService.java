package com.spt.evt.service;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

public interface ScoreBoardService {

	public ScoreBoard findByCommiteeAndTopic(Person committee, Topic topic,Person examiner);

}
