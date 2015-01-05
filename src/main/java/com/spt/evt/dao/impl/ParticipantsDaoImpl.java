package com.spt.evt.dao.impl;

import com.spt.evt.dao.ParticipantsDao;
import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.Arrays;
import java.util.List;

@Repository
public class ParticipantsDaoImpl extends TemplateEntityManagerDao implements ParticipantsDao {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ParticipantsDaoImpl.class);
	
	@Override
	@Transactional(readOnly = true)
	public List<Participants> findByExample(Participants participants) {
		Query query = this.getEntityManager().createQuery("FROM Participants");
		return query.getResultList();
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Participants> findByRoom(Room room) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Participants.class);
		criteria.add(Restrictions.eq("room", room));
		List<Participants> result = criteria.list();
		return result;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Participants> findByPerson(Person person) {
		Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Participants.class);
		criteria.add(Restrictions.eq("person", person));
		List<Participants> result = criteria.list();
		return result;
	}

    @Override
    @Transactional(readOnly = true)
    public List<Participants> findByPersonByRole(Person person) {
        String status = "examiner";
        Criteria criteria = ((Session) this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteria.add(Restrictions.eq("person", person));
        criteria.add(Restrictions.eq("role",status));
        List<Participants> result = criteria.list();
        return result;
    }
    @Override
    @Transactional(readOnly = true)
    public List<Participants> findPersonWithRequestCommittee(Room room) {
        Criteria criteria=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteria.add(Restrictions.eq("room",room));
        criteria.add(Restrictions.in("role", Arrays.asList("wait", "see")));
        List<Participants> result = criteria.list();
        return result;
    }

    @Override
    @Transactional
    public void setRoleInPaticipants(Long paticipantId,String role) {
      Participants participants= (Participants) this.getEntityManager().find(Participants.class,paticipantId);
        if(role.equals("wait")){
            participants.setRole("see");
        }else if(role.equals("committee")){
            participants.setRole("committee");
        }
      this.getEntityManager().merge(participants);
    }

    @Override
    @Transactional
    public String addRequestCommittee(Room room, Person person) {
        Criteria criteriaAdd=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteriaAdd.add(Restrictions.eq("room",room));
        criteriaAdd.add(Restrictions.eq("person",person));
        Participants add= (Participants) criteriaAdd.uniqueResult();
        if(add==null){
            Participants participants=new Participants();
            participants.setRole("wait");
            participants.setModulator(false);
            participants.setPerson(person);
            participants.setRoom(room);
            this.getEntityManager().merge(participants);
            return "success";
        }else{
            return "fail";
        }

    }

    @Override
    @Transactional
    public Long removeRequestCommittee(Room room, Person person) {
        Criteria criteria=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteria.add(Restrictions.eq("room",room));
        criteria.add(Restrictions.eq("person",person));
        Participants participantsRemove= (Participants) criteria.uniqueResult();
        Long paticipantId=participantsRemove.getId();
        this.getEntityManager().remove(participantsRemove);
        return paticipantId;
    }

    @Override
    @Transactional
    public void addModulatorAndUpdateCommittee(Room roomApprove, Person personApprove, Person personInRoom) {
        Criteria criteriaAdd=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteriaAdd.add(Restrictions.eq("room",roomApprove));
        criteriaAdd.add(Restrictions.eq("person",personApprove));
        Participants add= (Participants) criteriaAdd.uniqueResult();
        add.setModulator(true);
        add.setRole("committee");
        add.setRoom(roomApprove);
        add.setPerson(personApprove);
        this.getEntityManager().merge(add);
        Criteria criteriaUpdate=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteriaUpdate.add(Restrictions.eq("room",roomApprove));
        criteriaUpdate.add(Restrictions.eq("person",personInRoom));
        Participants update= (Participants) criteriaUpdate.uniqueResult();
        update.setRole("committee");
        update.setModulator(false);
        update.setRoom(roomApprove);
        update.setPerson(personInRoom);
        this.getEntityManager().merge(update);
    }

    @Override
    @Transactional(readOnly = true)
    public Participants findById(Long id) {
        Participants participants= (Participants) this.getEntityManager().find(Participants.class,id);
        return participants;
    }

    @Override
    @Transactional(readOnly = true)
    public Long findParticipantId(Room room, Person person) {
        Criteria criteria=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteria.add(Restrictions.eq("room",room));
        criteria.add(Restrictions.eq("person",person));
        Participants participants= (Participants) criteria.uniqueResult();
        return participants.getId();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Participants> allPersonToApprove(Room room) {
        Criteria criteria=((Session)this.getEntityManager().getDelegate()).createCriteria(Participants.class);
        criteria.add(Restrictions.eq("room",room));
        criteria.add(Restrictions.eq("modulator",false));
        criteria.add(Restrictions.eq("role","committee"));
        List<Participants>  allPersonToApprove=criteria.list();
        return allPersonToApprove;
    }

    @Override
    @Transactional
    public void persistParticipants(Participants participants) {
        this.getEntityManager().persist(participants);
    }

    @Override
    @Transactional
    public void editParticipants(Participants participants){
//      Participants participantsII = this.getEntityManager().find(Participants.class, participants.getId());
        this.getEntityManager().merge(participants);
        LOGGER.debug("EditPaticipants");
    }
}
