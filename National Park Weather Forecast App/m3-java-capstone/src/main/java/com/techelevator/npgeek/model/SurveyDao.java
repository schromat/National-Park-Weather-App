package com.techelevator.npgeek.model;

import java.util.List;
import java.util.Map;

public interface SurveyDao {

	public Map<String, Integer> getSurveyResults();
	public List<Survey> getSurveysByPark(String parkcode);
	public void saveSurvey(Survey survey);

	
}
