package com.guest.likehome.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.post.mapper.PostSQLMapper;
import com.guest.likehome.product.mapper.ProductSQLMapper;
import com.guest.likehome.vo.PostVo;
import com.guest.likehome.vo.SubpostVo;

@Service
public class MainServiceImpl {

   @Autowired
   private PostSQLMapper postSQLMapper;
   
   @Autowired
   private ProductSQLMapper productSQLMapper;
   
   public HashMap<String, Object> mainPageData(){
      HashMap<String, Object> mainData = new HashMap<String, Object>();
      ArrayList<HashMap<String, Object>> postDataList = new ArrayList<HashMap<String,Object>>();
      ArrayList<PostVo> postList = postSQLMapper.selectPostByPostLikeCount();
      
      
      for(PostVo postVo: postList) {
         ArrayList<SubpostVo> subPostList = postSQLMapper.selectSubPostByPostNo(postVo.getPost_no());
         SubpostVo subpostVo = subPostList.get(0);
         
         HashMap<String, Object> map = new HashMap<String, Object>();
      
         map.put("postVo", postVo);
         map.put("subpostVo", subpostVo);
         postDataList.add(map);
      }
      
      
      mainData.put("postDataList", postDataList);
      return mainData;
   }
   
   
   
   
}