package com.spt.evt.service.impl;

import com.spt.evt.entity.Room;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.AveragesCalculationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

@Service
public class AveragesCalculationImpl implements AveragesCalculationService {

	private static final Logger logger = LoggerFactory.getLogger(AveragesCalculationImpl.class);


	@Override
	public Map<Room, Map<String, Object>> calculation(Map<Room, Map<Topic, List<Double>>> scoreExaminer) {
		Map<Room, Map<String, Object>> result = new HashMap<Room, Map<String, Object>>();

		for (Room keyRoom : scoreExaminer.keySet()) {
			Map<Topic, List<Double>> scoresOfTopics = scoreExaminer.get(keyRoom);
			Double scoreOfRoom = 0.0;
			Integer i = 0;
			for (Topic keyTopic : scoresOfTopics.keySet()) {
				List<Double> scoresOfTopic = scoresOfTopics.get(keyTopic);
				Double scoreOfTopic = mean(scoresOfTopic); //Can Change to Mode
				scoreOfRoom+=scoreOfTopic;
				i++;
			}

			Map<String, Object> scores = new HashMap<String, Object>();
			scores.put("score", scoreOfRoom);
				scores.put("topicTotal",i);
			result.put(keyRoom, scores);
		}
		return result;
	}


	public Double mode(List<Double> scores) {
		Map<Double, Integer> seen = new HashMap<Double, Integer>();
		int max = 0;
		List<Double> maxElement = new ArrayList<Double>();
		for (Double value : scores) {
			if (seen.containsKey(value)) {
				seen.put(value, seen.get(value) + 1);
			} else {
				seen.put(value, 1);
			}
			if (seen.get(value) > max) {
				max = seen.get(value);
				maxElement.clear();
				maxElement.add(value);
			} else if (seen.get(value) == max) {
				maxElement.add(value);
			}
		}

		Double result = 0.0;
		if(1<maxElement.size()) {
			result = mean(maxElement);
		}else {
			try {
				result = maxElement.get(0);
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	@Override
	public Double mean(List<Double> scores) {
		Double sum=0.0;
		Integer size = scores.size();
		for(int i=0;i< size;i++){
			sum+=scores.get(i);
		}
		Double result = new Double(Math.round((sum / size)*100.0) / 100.0);
		return result;
	}
}