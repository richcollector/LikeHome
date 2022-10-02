package com.guest.likehome.main.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guest.likehome.help.service.HelpServiceImpl;

@RestController
@RequestMapping("/main/*")
public class RestMainController {
	
	@Autowired
	HelpServiceImpl helpService;

	@RequestMapping("isHelpQnaAnswered")
	public HashMap<String, Object> restIsHelpQnaAnsweredProcess(String value){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(value.equals("all")) {
			map.put("data", helpService.getHelpQnaDataList(value));
		} else {
			map.put("data", helpService.getHelpQnaDataListByAnswerState(value));
		}
		
		map.put("result", "success");
		return map;
	}
	
}
