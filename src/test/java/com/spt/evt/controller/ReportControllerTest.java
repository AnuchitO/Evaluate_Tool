package com.spt.evt.controller;

import com.spt.evt.entity.Participants;
import com.spt.evt.entity.Person;
import com.spt.evt.service.ParticipantsService;
import com.spt.evt.service.PersonService;
import com.spt.evt.service.ReportService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Created by : Anuchit Prasertsang 
 * Created Date : 06/11/2014
 */
public class ReportControllerTest extends TemplateTestController {
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportControllerTest.class);
	private MockMvc mockMvc;

	@Autowired
	private WebApplicationContext webApplicationContext;
	@Autowired
	private ReportService reportService;
	@Autowired
	private PersonService personService;
	@Autowired
	private ParticipantsService participantsService;

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}

	@Test
	public void get_showEvaluateBoard() throws Exception {
		mockMvc.perform(get("/report"))
		.andExpect(status().isOk())
		.andExpect(view().name("report"))
		.andExpect(forwardedUrl("/WEB-INF/layouts/master.jsp"));
	}

	@Test
	public void jsonSample() throws Exception {
		LOGGER.debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAa");
	}

	@Test
	public void testShowSummaryByTopic() throws Exception {
		mockMvc.perform(get("/summaryByTopic"))
		.andExpect(status().isOk())
		.andExpect(view().name("summaryByTopic"))
		.andExpect(forwardedUrl("/WEB-INF/layouts/master.jsp"));
	}

	@Test
	public void testGetRoomName()throws Exception{
		Long personId = 7L;
		mockMvc.perform(get("/getRoomName"));
		Person person = personService.findById(personId);
		List<Participants> participants = participantsService.findByPerson(person);
		Assert.assertNotNull(participants.toString());
	}

	@Test
	public void testExcelView()throws Exception{
		String roomId = "3";
		String examinerId = "7";
		String committeeId = "2";
		String courseId = "1";
		mockMvc.perform(get("/exportExcel").param("roomId", roomId).param("examinerId", examinerId).param("committeeId", committeeId).param("courseId", courseId))
				.andExpect(status().isOk())
				.andExpect(view().name("excelView"));

	}
}