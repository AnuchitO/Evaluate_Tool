package com.spt.evt.service;

import com.spt.evt.entity.Room;
import com.spt.evt.entity.Topic;

import java.util.List;
import java.util.Map;


public interface AveragesCalculationService {
	public Map<Room,Map<String,Object>> calculation(Map<Room,Map<Topic,List<Double>>> scoreExaminer);
	public Double mean(List<Double> scores);
	public Double mode(List<Double> scores);
}
