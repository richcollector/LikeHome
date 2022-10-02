package com.guest.likehome.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guest.likehome.admin.service.AdminServiceImpl;
import com.guest.likehome.help.service.HelpServiceImpl;
import com.guest.likehome.vo.HelpQnaVo;

@RestController
@RequestMapping("/admin/*")
public class RestAdminController {
	
	@Autowired
	private HelpServiceImpl helpservice;
	@Autowired
	private AdminServiceImpl adminService;
	
	@RequestMapping("QnaAnswerRegisterProcess")
	public HashMap<String, Object> QnaAnswerRegisterProcess(HelpQnaVo helpQnaVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		helpservice.updateQnaAnswer(helpQnaVo);
		
		int helpQnaNo = helpQnaVo.getHelp_qna_no();
		
		map.put("result", "success");
		map.put("data", helpservice.getHelpQnaData(helpQnaNo));
		
		return map;
	}
	
	@RequestMapping("updateByVendorState")
	public void updateByVendorState(String vendor_state, int vendor_no) {
		adminService.updateByVendorState(vendor_state, vendor_no);
	}
	
	@RequestMapping("selectByVendorState")
	public boolean selectByVendorState(int vendor_no) {
		System.out.println(adminService.selectByVendorState(vendor_no));
		return adminService.selectByVendorState(vendor_no);
	}
	
	@RequestMapping("adminLoginCheckProcess")
	public HashMap<String, Object> adminLoginCheckProcess(String admin_id,String admin_pw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", adminService.countSelectAdminId(admin_id));
		map.put("pw", adminService.countSelectAdminPw(admin_id, admin_pw));
		return map;
	}
}
