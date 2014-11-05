package com.spt.evt.controller;
import static org.hamcrest.core.Is.is;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
/**
 * Created by : Anuchit Prasertsang 
 * Created Date : 21/10/2014
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ActiveProfiles("test")
@Configurable
@ContextConfiguration({"classpath:META-INF/spring/evaluatetool-context.xml", "classpath:META-INF/spring/evaluatetool/evaluatetool-servlet.xml"})
public abstract class TemplateTestController   { 

}
