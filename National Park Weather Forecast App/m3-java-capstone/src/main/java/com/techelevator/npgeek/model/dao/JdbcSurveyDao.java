package com.techelevator.npgeek.model.dao;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDao;

@Component
public class JdbcSurveyDao implements SurveyDao{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcSurveyDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Map<String, Integer> getSurveyResults() {
		Map<String, Integer> surveyResults = new LinkedHashMap<String, Integer>();
		String sql = "SELECT parkcode, COUNT(surveyid) FROM survey_result GROUP BY parkcode ORDER BY count desc, parkcode;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
		while(results.next()) {
			surveyResults.put(results.getString("parkcode"), results.getInt("count"));
		}
		return surveyResults;
	}
	
	@Override
	public List<Survey> getSurveysByPark(String parkcode) {
		List<Survey> surveys = new ArrayList<Survey>();
		String sql = "SELECT * FROM survey_result WHERE parkcode = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, parkcode);
		while(results.next()) {
			surveys.add(mapRowToSurvey(results));
		}
		return surveys;
	}
	
	@Override
	public void saveSurvey(Survey survey) {
		survey.setSurveyId(getNextId());
		String sql = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) "
																			     + "VALUES (?,?,?,?,?);";
		jdbcTemplate.update(sql, survey.getSurveyId(),
								 survey.getParkCode(),
								 survey.getEmail(),
								 survey.getState(),
								 survey.getActivityLevel());
	}
	
	private Survey mapRowToSurvey(SqlRowSet results) {
		Survey survey = new Survey();
		survey.setSurveyId(results.getInt("surveyid"));
		survey.setParkCode(results.getString("parkcode"));
		survey.setEmail(results.getString("emailaddress"));
		survey.setState(results.getString("state"));
		survey.setActivityLevel(results.getString("activitylevel"));
		return survey;
	}
	
	private int getNextId() {
		String sql = "SELECT NEXTVAL('seq_surveyid')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
		int id;
		if(results.next()) {
			id = results.getInt(1);
		} else {
			throw new RuntimeException("Something went wrong");
		}
		return id;
	}
}
