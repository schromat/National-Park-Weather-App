package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDao;

@Controller
public class HomePageController {
	
	@Autowired
	private ParkDao parkDao;
	
	@RequestMapping ("/") 
	public String showHomePage(HttpSession session, ModelMap map) {
		if(session.getAttribute("tempScale") == null) {
			session.setAttribute("tempScale", "F");
		}
		List<Park> list = parkDao.getAllParks();
		map.put("allParks", list);
		return "homePage";
	}
	
	

}
