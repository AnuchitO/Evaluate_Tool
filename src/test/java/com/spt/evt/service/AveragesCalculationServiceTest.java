package com.spt.evt.service;

import com.spt.evt.entity.Room;
import com.spt.evt.entity.Topic;
import junit.framework.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class AveragesCalculationServiceTest extends AbstractTestService {
    public static final Logger LOGGER = LoggerFactory.getLogger(AveragesCalculationServiceTest.class);

    @Autowired
    private AveragesCalculationService averagesCalculationService;

    private ArrayList<Double> getArrayList() {
        return new ArrayList<Double>();
    }

    private void setScores(List<Double> scores) {
        scores.add(1.0);
        scores.add(7.0);
        scores.add(3.0);
    }

    @Test
    public void testCaluationShouldBeSummaryScoreOfRoom() throws Exception {
        Map<Room, Map<Topic, List<Double>>> scoreExaminer = new HashMap<Room, Map<Topic, List<Double>>>();
        List<Double> scores = getArrayList();
        setScores(scores);

        Topic topic = new Topic();
        topic.setId(1L);
        Room room = new Room();

        Map<Topic, List<Double>> scoreTopic = new HashMap<Topic, List<Double>>();
        scoreTopic.put(topic, scores);
        scoreExaminer.put(room, scoreTopic);

        Map<Room, Map<String, Object>> result = this.averagesCalculationService.calculation(scoreExaminer);
        Assert.assertEquals(3.67,result.get(room).get("score"));
        Assert.assertEquals(1,result.get(room).get("topicTotal"));
    }

    @Test
    public void testMeanInput_1plus7plus3_ShouldBe3dot67() throws Exception {
        List<Double> scores = getArrayList();
        setScores(scores);
        Double result = this.averagesCalculationService.mean(scores);
        Assert.assertEquals(3.67,result);
    }

    @Test
    public void testModeInput_1_3_6_6_6_6_7_7_12_12_17_ShouldBe6() throws Exception {
        List<Double> scores = getArrayList();
            scores.add(1.0);
            scores.add(3.0);
            scores.add(6.0);
            scores.add(6.0);
            scores.add(6.0);
            scores.add(6.0);
            scores.add(7.0);
            scores.add(7.0);
            scores.add(7.0);
            scores.add(12.0);
            scores.add(12.0);
            scores.add(17.0);
        Double result = this.averagesCalculationService.mode(scores);
        Assert.assertEquals(6.0,result);
    }

    @Test
    public void testModeInput_1_1_2_4_4_ShouldBe2dot5() throws Exception {
        List<Double> scores = getArrayList();
            scores.add(1.0);
            scores.add(1.0);
            scores.add(2.0);
            scores.add(4.0);
            scores.add(4.0);
        Double result = this.averagesCalculationService.mode(scores);
        Assert.assertEquals(2.5,result);
    }


}
