package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spt.evt.dao.ScoreBoardDao;
import com.spt.evt.dao.TopicDao;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

@Repository
public class ScoreBoardDaoImpl extends TemplateHibernateDaoSupport implements
		ScoreBoardDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ScoreBoardDaoImpl.class);

	@Override
	public ScoreBoard findByRoomAndCommiteeAndTopicAndExaminer(Room room, Person committee, Topic topic,Person examiner) {
		DetachedCriteria criteria = DetachedCriteria.forClass(ScoreBoard.class);
		criteria.add(Restrictions.eq("room", room));
		criteria.add(Restrictions.eq("committee", committee));
		criteria.add(Restrictions.eq("topic", topic));
		criteria.add(Restrictions.eq("examiner", examiner));
		criteria.addOrder(Order.asc("id"));
		
		ScoreBoard sample = new ScoreBoard();
		sample.setRoom(room);
		sample.setCommittee(committee);
		sample.setTopic(topic);
		sample.setExaminer(examiner);
		
		List<ScoreBoard> result = (List<ScoreBoard>) this.getHibernateTemplate().findByCriteria(criteria);
		ScoreBoard scoreBoard = null;
		try {
			scoreBoard = result.get(0);
		} catch (Exception e) {

		}
		return scoreBoard;
	}
	
	@Override
	@Transactional
	public void save(ScoreBoard scoreBoard) {
		this.getHibernateTemplate().save(scoreBoard);
		
	}
	
	@Override
	@Transactional
	public void saveOrUpdate(ScoreBoard scoreBoard) {
		this.getHibernateTemplate().saveOrUpdate(scoreBoard);
		
	}

	@Override
	public List<ScoreBoard> findByRoom(Room room) {
		DetachedCriteria criteria = DetachedCriteria.forClass(ScoreBoard.class);
		criteria.add(Restrictions.eq("room", room));
		List<ScoreBoard> resultScoreBoard = (List<ScoreBoard>) this.getHibernateTemplate().findByCriteria(criteria);
		return resultScoreBoard;
	}

}
