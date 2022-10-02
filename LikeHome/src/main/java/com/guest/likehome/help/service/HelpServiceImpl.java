package com.guest.likehome.help.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.help.mapper.HelpSQLMapper;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.HelpQnaTypeVo;
import com.guest.likehome.vo.HelpQnaVo;

@Service
public class HelpServiceImpl {
	
	@Autowired
	HelpSQLMapper helpSQLMapper;
	
	@Autowired
	CustomerSQLMapper customerSQLMapper;
	
	public void registerHelpQna(HelpQnaVo helpQnaVo) {
		
		helpSQLMapper.registerHelpQna(helpQnaVo);
	}
	
	
	public ArrayList<HashMap<String, Object>> getHelpQnaDataList(String value) {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<HelpQnaVo> helpQnaList = helpSQLMapper.selectHelpQnaAll();
		
		for(HelpQnaVo helpQnaVo : helpQnaList) {
			int customerNo = helpQnaVo.getCustomer_no();
			int helpQnaTypeNo = helpQnaVo.getHelp_qna_type_no();
			CustomerVo customerVo = customerSQLMapper.selectCustomerByCustomerNo(customerNo);
			HelpQnaTypeVo helpQnaTypeVo = helpSQLMapper.selectQnaTypeByhelpQnaTypeNo(helpQnaTypeNo);
			
			System.out.println(helpQnaVo.getHelp_qna_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("helpQnaTypeVo", helpQnaTypeVo);
			map.put("helpQnaVo", helpQnaVo);
			map.put("customerVo", customerVo);
			
			dataList.add(map);
		}
		
		return dataList;
	}
	
	public ArrayList<HashMap<String, Object>> getHelpQnaDataListByAnswerState(String value){
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
	
		if(value.equals("answered")){
			
			ArrayList<HelpQnaVo> helpQnaList = helpSQLMapper.selectHelpQnaVoByAnswered();
			
			for(HelpQnaVo helpQnaVo : helpQnaList) {
				int customerNo = helpQnaVo.getCustomer_no();
				CustomerVo customerVo = customerSQLMapper.selectCustomerByCustomerNo(customerNo);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("helpQnaVo", helpQnaVo);
				map.put("customerVo", customerVo);
				
				dataList.add(map);
			}
			
		} else{
			ArrayList<HelpQnaVo> helpQnaList = helpSQLMapper.selectHelpQnaVoByNotAnswered();
			
			for(HelpQnaVo helpQnaVo : helpQnaList) {
				int customerNo = helpQnaVo.getCustomer_no();
				CustomerVo customerVo = customerSQLMapper.selectCustomerByCustomerNo(customerNo);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("helpQnaVo", helpQnaVo);
				map.put("customerVo", customerVo);
				
				dataList.add(map);
			}
			
		}
		return dataList;
	}
	
	public HashMap<String, Object> getHelpQnaData(int helpQnaNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HelpQnaVo helpQnaVo = helpSQLMapper.selectHelpQnaByHelpQnaNo(helpQnaNo);
		int customerNo = helpQnaVo.getCustomer_no();
		
		CustomerVo customerVo = customerSQLMapper.selectCustomerByCustomerNo(customerNo);
		
		map.put("helpQnaVo", helpQnaVo);
		map.put("customerVo", customerVo);
		
		return map;
	}
	
	public void deleteHelpQnaBoard(int helpQnaNo) {
		helpSQLMapper.deleteHelpQnaBoardByHelpQnaNo(helpQnaNo);
	}
	
	public void updateHelpQnaTitleAndContent(HelpQnaVo helpQnaVo) {
		helpSQLMapper.updateHelpQnaTitleAndContent(helpQnaVo);
	}
	
	public void updateQnaAnswer(HelpQnaVo helpQnaVo) {
		helpSQLMapper.updateQnaAnswer(helpQnaVo);
	}
	
	public ArrayList<HelpQnaTypeVo> selectQnaTypeAll( ){
		return helpSQLMapper.selectQnaTypeAll();
	}
	
	public void selectQnaTypeByhelpQnaTypeNo(int helpQnaTypeNo) {
		helpSQLMapper.selectQnaTypeByhelpQnaTypeNo(helpQnaTypeNo);
	}
	
}
