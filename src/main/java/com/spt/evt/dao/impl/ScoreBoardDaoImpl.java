package com.spt.evt.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.Criteria;
import org.hibernate.Session;
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
import com.spt.evt.dao.impl.TemplateEntityManagerDao;
import javax.persistence.EntityManager;

@Repository
public class ScoreBoardDaoImpl extends TemplateEntityManagerDao implements
		ScoreBoardDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ScoreBoardDaoImpl.class);

	@Override
	@Transactional(readOnly = true)
	public ScoreBoard findByRoomAndCommiteeAndTopicAndExaminer(Room room, Person committee, Topic topic,Person examiner) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(ScoreBoard.class);
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
		
		List<ScoreBoard> result = criteria.list();
		ScoreBoard scoreBoard = null;
		try {
			scoreBoard = result.get(0);
		} catch (Exception e) {

		}
		return scoreBoard;
	}
	@Override
	@Transactional(readOnly = true)
	public List<ScoreBoard> findByRoomAndTopicAndExaminer(Room room,Topic topic,Person examiner){

		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(ScoreBoard.class);
		criteria.add(Restrictions.eq("room", room));
		criteria.add(Restrictions.eq("topic", topic));
		criteria.add(Restrictions.eq("examiner", examiner));
		criteria.addOrder(Order.asc("id"));

		ScoreBoard sample = new ScoreBoard();
		sample.setRoom(room);
		sample.setTopic(topic);
		sample.setExaminer(examiner);

		List<ScoreBoard> result = criteria.list();

		return result;
	}

	@Override
	@Transactional
	public void save(ScoreBoard scoreBoard) {
		this.getEntityManager().persist(scoreBoard);
		
	}
	
	@Override
	@Transactional
	public void saveOrUpdate(ScoreBoard scoreBoard) {
		this.getEntityManager().merge(scoreBoard);
		
	}

	@Override
	@Transactional(readOnly = true)
	public List<ScoreBoard> findByRoom(Room room) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(ScoreBoard.class);
		criteria.add(Restrictions.eq("room", room));
		List<ScoreBoard> resultScoreBoard = criteria.list();
		return resultScoreBoard;
	}

}
