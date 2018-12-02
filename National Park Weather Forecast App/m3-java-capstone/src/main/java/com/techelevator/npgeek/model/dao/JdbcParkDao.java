package com.techelevator.npgeek.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;

@Component
public class JdbcParkDao implements ParkDao{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcParkDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Park> getAllParks() {
		List<Park> allParks = new ArrayList<Park>();
		String sql = "SELECT parkcode, parkname, parkdescription FROM park ORDER BY parkname;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
		while(results.next()) {
			Park park = new Park();
			park.setCode(results.getString("parkcode"));
			park.setName(results.getString("parkname"));
			park.setDescription(results.getString("parkdescription"));
			allParks.add(park);
		}
		return allParks;
	}
	
	@Override
	public Park getParkByCode(String parkcode) {
		Park park = new Park();
		String sql = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, parkcode);
		while(results.next()) {
			park = mapRowToPark(results);
		}
		return park;
	}
	
	private Park mapRowToPark(SqlRowSet results) {
		Park park = new Park();
		park.setCode(results.getString("parkcode"));
		park.setName(results.getString("parkname"));
		park.setState(results.getString("state"));
		park.setAcreage(results.getInt("acreage"));
		park.setElevationInFeet(results.getInt("elevationinfeet"));
		park.setMilesOfTrail(results.getDouble("milesoftrail"));
		park.setNumberOfCampsites(results.getInt("numberofcampsites"));
		park.setClimate(results.getString("climate"));
		park.setYearFounded(results.getInt("yearfounded"));
		park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
		park.setInspirationalQuote(results.getString("inspirationalquote"));
		park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
		park.setDescription(results.getString("parkdescription"));
		park.setEntryFee(results.getInt("entryfee"));
		park.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));
		return park;
	}

}
