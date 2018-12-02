package com.techelevator.npgeek;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDao;

@Controller
public class SurveyController {
	
	@Autowired
	private ParkDao parkDao;
	
	@Autowired
	private SurveyDao surveyDao;
	
	@RequestMapping(path="/surveyForm", method=RequestMethod.GET)
	public String showSurveyForm(ModelMap map) {
		List<Park> list = parkDao.getAllParks();
		map.put("allParks", list);
		return "/surveyForm";
	}
	
	@RequestMapping(path="/surveyForm", method=RequestMethod.POST)
	public String submitSurvey(@RequestParam String parkCode,
		 					  @RequestParam String email,
		 					  @RequestParam String state,
		 					  @RequestParam String activitylvl) {
		
		if(!email.contains("@") || email.equals("") || (!email.contains(".com") && !email.contains(".net"))) {
			return "redirect:/surveyForm";
		} else {
			Survey survey = new Survey();
			survey.setParkCode(parkCode);
			survey.setEmail(email);
			survey.setState(state);
			survey.setActivityLevel(activitylvl);
			surveyDao.saveSurvey(survey);
			return "redirect:/surveyFavorites";
		}
	}
	
	@RequestMapping(path="/surveyFavorites", method=RequestMethod.GET)
	public String showSurveyFavorites(ModelMap map) {
		Map<String, Integer> surveyResults = surveyDao.getSurveyResults();
		List<Park> list = parkDao.getAllParks();
		map.put("surveyResults", surveyResults);
		map.put("allParks", list);
		return "surveyFavorites";
	}

}
