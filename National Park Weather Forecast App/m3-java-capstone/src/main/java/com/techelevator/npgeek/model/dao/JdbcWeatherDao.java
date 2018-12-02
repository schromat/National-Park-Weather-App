package com.techelevator.npgeek.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDao;

@Component
public class JdbcWeatherDao implements WeatherDao{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcWeatherDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Weather> getWeatherForecastForPark(String parkcode) {
		List<Weather> weatherForecast = new ArrayList<Weather>();
		String sql = "SELECT * FROM weather WHERE parkcode = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, parkcode);
		while(results.next()) {
			weatherForecast.add(mapRowToWeather(results));
		}
		return weatherForecast;
		
	}
	
	private Weather mapRowToWeather(SqlRowSet results) {
		Weather weather = new Weather();
		weather.setParkCode(results.getString("parkcode"));
		weather.setFiveDayForecastValue(results.getInt("fivedayforecastvalue"));
		weather.setLow(results.getInt("low"));
		weather.setHigh(results.getInt("high"));
		weather.setForecast(results.getString("forecast"));
		return weather;
	}
}
