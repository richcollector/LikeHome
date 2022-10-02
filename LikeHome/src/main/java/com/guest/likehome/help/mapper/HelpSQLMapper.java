package com.guest.likehome.help.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.HelpQnaTypeVo;
import com.guest.likehome.vo.HelpQnaVo;

public interface HelpSQLMapper {

	public void registerHelpQna(HelpQnaVo helpQnaVo);
	public ArrayList<HelpQnaVo> selectHelpQnaAll();
	
	public HelpQnaVo selectHelpQnaByHelpQnaNo(int helpQnaNo);
	public void deleteHelpQnaBoardByHelpQnaNo(int helpQnaNo);
	public void updateHelpQnaTitleAndContent(HelpQnaVo helpQnaVo);
	public void updateQnaAnswer(HelpQnaVo helpQnaVo);
	
	public ArrayList<HelpQnaTypeVo> selectQnaTypeAll();
	public HelpQnaTypeVo selectQnaTypeByhelpQnaTypeNo(int helpQnaTypeNo);
	
	public ArrayList<HelpQnaVo> selectHelpQnaVoByAnswered();
	public ArrayList<HelpQnaVo> selectHelpQnaVoByNotAnswered();
	
}
