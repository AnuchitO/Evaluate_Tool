package com.spt.evt.service;

import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import static org.hamcrest.core.Is.is;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class ExaminationRoomServiceTest extends AbstractTestService {
	public static final Logger LOGGER = LoggerFactory.getLogger(ExaminationRoomServiceTest.class);

	@Autowired
	private ExaminationRoomService examinationService;

	@Test
	public void testRoomInformationShouldBeJsonOfRoom() {

		JSONObject roomInformation = this.examinationService.getRoomInformation();
		LOGGER.error("*****************&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&******* ");
		LOGGER.error("************************ {}",roomInformation.toString());
		Assert.assertTrue(roomInformation.has("room"));
		Assert.assertNotNull(roomInformation);
	}

	@Test
	public void testPersonInRoomInformationShouldBeJsonOfPersonInRoom() throws Exception {
		Long roomId = 1L;
		Long examinerId= 2L;
		Long committeeId  = 3L;
		Long modulatorId = 2L;
		JSONObject personInRoomInformation = this.examinationService.getPersonInRoomInformation(roomId, examinerId, committeeId, modulatorId);
		Assert.assertTrue(personInRoomInformation.has("idRoom"));
		Assert.assertTrue(0!=personInRoomInformation.length());
	}

    @Test
    public void testFindParticipantsByPersonId1(){
        Long personId=1L;
        JSONObject participantsDetail=this.examinationService.findParticipantsByPersonId(personId);
        Assert.assertTrue(participantsDetail.has("room"));
        Assert.assertTrue(participantsDetail.length()!=0);
        Assert.assertNotNull(participantsDetail.getJSONArray("room"));
    }

    @Test
    public void testAddRequestCommitteeShouldBeRoomId1PersonId12(){
        Long roomId=1L;
        Long personId=12L;
        String complete=this.examinationService.addRequestCommittee(roomId,personId);
        Assert.assertThat(complete,is("success"));
    }

    @Test
    public void testAddRequestCommitteeShouldBeRoomId1PersonId1(){
        Long roomId=1L;
        Long personId=1L;
        String complete=this.examinationService.addRequestCommittee(roomId,personId);
        Assert.assertThat(complete,is("fail"));
    }

}
