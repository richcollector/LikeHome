package com.guest.likehome.post.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.guest.likehome.post.service.PostServiceImpl;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.NestedCommentLikeVo;
import com.guest.likehome.vo.NestedCommentVo;
import com.guest.likehome.vo.PostScrapVo;
import com.guest.likehome.vo.PostVo;
import com.guest.likehome.vo.PostCommentVo;
import com.guest.likehome.vo.PostLikeVo;
import com.guest.likehome.vo.PostReportVo;
import com.guest.likehome.vo.SubpostProductVo;
import com.guest.likehome.vo.SubpostVo;

@Controller
@RestController
@RequestMapping("/post/*")
public class RestPostController {

	@Autowired
	private PostServiceImpl postService;


	
	
	@RequestMapping("restPostRegisterProcess")
	public HashMap<String, Object> restPostRegisterProcess (PostVo postVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int customer_no = 0;
		if((CustomerVo)session.getAttribute("customerInfo") !=null) {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
			customer_no = customerVo.getCustomer_no();
		}
		int postPk = postService.PostPk();
		postVo.setPost_no(postPk);
		postVo.setCustomer_no(customer_no);
		
		postService.registerPost(postVo);
		map.put("result", true);
		map.put("post_no", postPk);
		return map;
	}
	
	@RequestMapping("restSubPostRegisterProcess")
	public HashMap<String, Object> restSubPostRegisterProcess (
			HttpSession session,
			MultipartFile file,
			SubpostVo subPostVo,
			String [] hashtag_keyword,
			@RequestParam(value = "product_no", defaultValue = "0")  int [] product_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		MultipartFile image = file;
				String rootFilePath = "/uploadFiles/";
				String getOriginalFilename= image.getOriginalFilename();
			
				String randomName= UUID.randomUUID().toString();
				randomName += "_" + System.currentTimeMillis();
				
				String ext = getOriginalFilename.substring(getOriginalFilename.lastIndexOf("."));
				randomName += ext;
				
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
				String todayFolderNmae = sdf.format(today);
				
				File todayFolder= new File(rootFilePath + todayFolderNmae);
				
				if(!todayFolder.exists()) {
					todayFolder.mkdirs();
				}
				
				try {
					image.transferTo(new File(rootFilePath+todayFolderNmae+randomName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				subPostVo.setSubpost_image_link(todayFolderNmae+randomName);
				subPostVo.setSubpost_image_filename(getOriginalFilename);
			
		int customer_no = 0;
		if((CustomerVo)session.getAttribute("customerInfo") !=null) {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
			customer_no = customerVo.getCustomer_no();
		}
		
		int PostNo = postService.PostPkForSubPost(customer_no);
		subPostVo.setPost_no(PostNo);
		postService.RegisterSubPost(subPostVo);
		int subpost_No = postService.subpostNoForHashtag(PostNo);
		if(0 !=hashtag_keyword.length) {
			for(String hashtag_keywords : hashtag_keyword) {
				if(postService.hasHashTag(hashtag_keywords)) {
					int hashtag_no = postService.hashtagNo(hashtag_keywords);
					postService.RegisterSubPostHashtag(subpost_No, hashtag_no);
				}else {
					postService.RegisterHashtag(hashtag_keywords);
					int hashtag_no = postService.hashtagNo(hashtag_keywords);
					postService.RegisterSubPostHashtag(subpost_No, hashtag_no);
				}
			}
		}
		
		 if(product_no.length != 0) {
	         for(int productNo : product_no) {
	            if(productNo != 0) {
	            postService.registerSubPostProduct(subpost_No, productNo);
	            }
	         }
	      }
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("restfollowPostList")
	public HashMap<String, Object> restPostList (HttpSession session,
			String house_type_no, 
			String house_style_no, 
			String space_type_no, 
			String orderby){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> PostCategory = postService.getPostCategory();
		int customer_no = 0;
		if((CustomerVo)session.getAttribute("customerInfo") !=null) {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
			customer_no = customerVo.getCustomer_no();
		}
		ArrayList<HashMap<String, Object>> PostData = postService.getPostList(house_type_no, house_style_no, space_type_no, orderby, customer_no);
		
		map.put("PostData", PostData);
		map.put("PostCategory", PostCategory);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("restPostLikeProcess")
	public HashMap<String, Object> restPostLikeProcess(PostLikeVo postLikeVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int customer_no = 0;
		if((CustomerVo)session.getAttribute("customerInfo") !=null) {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
			customer_no = customerVo.getCustomer_no();
		}
		postLikeVo.setCustomer_no(customer_no);
		
		postService.LikePost(postLikeVo);
		boolean postLike = postService.checkPostLike(postLikeVo);
		int likeCount = postService.selectCountPostLike(postLikeVo.getPost_no());
		
		map.put("likeCount", likeCount);
		map.put("postLike", postLike);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("restPostScarpProcess")
	public HashMap<String, Object> restPostScarpProcess(PostScrapVo postScrapVo, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int customer_no = 0;
		if((CustomerVo)session.getAttribute("customerInfo") !=null) {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
			customer_no = customerVo.getCustomer_no();
		}
		
		postScrapVo.setCustomer_no(customer_no);
		PostScrapVo postScrap = postService.ScrapPost(postScrapVo);
		int postScrapCount = postService.CountPostScrap(postScrapVo.getPost_no());
		
		map.put("postScrapCount",postScrapCount);
		map.put("postScrap",postScrap);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("restPostDetail")
	public HashMap<String, Object> restPostDetail(int post_no, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		HashMap<String, Object> data = postService.getPostDetail(post_no, customer_no);
		
		map.put("customerInfo", customerInfo);
		map.put("data", data);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("restPostCommentLikeProcess")
	public HashMap<String, Object> restPostCommentLikeProcess (int post_comment_no, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		CustomerVo customerVo =(CustomerVo)session.getAttribute("customerInfo");
		int customer_no = customerVo.getCustomer_no();
		postService.LikePostComment(customer_no, post_comment_no);
		
		map.put("result", "success");
		
		return map;
	}
	@RequestMapping("restPostCommentRegisterProcess")
	public HashMap<String, Object> restPostCommentRegisterProcess(PostCommentVo post_CommentVo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
		post_CommentVo.setCustomer_no(customerVo.getCustomer_no());
		
		postService.RegisterPostComment(post_CommentVo);
		
		map.put("result", "success");
		return map;
	}

	
	@RequestMapping("restOrderProductList")
	public HashMap<String, Object> restOrderProductList (HttpSession session, String searchWord){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(searchWord.equals("undefined")) {
			searchWord = null;
		}
		
		CustomerVo customerVo =(CustomerVo)session.getAttribute("customerInfo");
		int customer_no = customerVo.getCustomer_no();
		ArrayList<HashMap<String, Object>> orderProductData = postService.getOrderedProductList(customer_no, searchWord);
		
		map.put("orderProductData",orderProductData);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("restSelectProductDetail")
	public HashMap<String, Object> restSelectProductDetail(int product_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		HashMap<String, Object> productDetail = postService.getProductDetail(product_no);
		
		map.put("productDetail", productDetail);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("restPostListPage")
	public HashMap<String, Object> postListPage(Model model, HttpSession session,
			String house_type_no, 
			String house_style_no, 
			String space_type_no, 
			String orderby) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		
		ArrayList<HashMap<String, Object>> data = postService.getPostList(house_type_no, house_style_no, space_type_no, orderby, customer_no);
				
		map.put("data", data);
		map.put("result", "seccess");
		
		return map; 
	}
	
	@RequestMapping("restNestedCommentRegisterProcess")
	public HashMap<String, Object> restNestedCommentRegisterProcess(HttpSession session, NestedCommentVo nestedCommentVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		nestedCommentVo.setCustomer_no(customer_no);
		postService.registerNestedComment(nestedCommentVo);
		
		return map;
	}
	
	@RequestMapping("restNestedCommentLikeProcess")
	public HashMap<String, Object> restNestedCommentLikeProcess(HttpSession session, NestedCommentLikeVo nestedCommentLikeVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		
		nestedCommentLikeVo.setCustomer_no(customer_no);
		
		return map;
	}
	
	@RequestMapping("restPostCommentDeleteProcess")
	public HashMap<String, Object> restPostCommentDeleteProcess(int post_comment_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		postService.deletePostComment(post_comment_no);
		
		map.put("result","success");
		
		return map;
	}
	
	@RequestMapping("restPostReportProcess")
	public HashMap<String, Object> restPostReportProcess(HttpSession session, PostReportVo postReportVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		
		postReportVo.setCustomer_no(customer_no);
		
		PostReportVo postReport = postService.PostReport(postReportVo);
		map.put("postReport", postReport);
		map.put("result", "success");
		return map;
	}
	
	
	 @RequestMapping("restgetTotalPostLikeCount")
	   public HashMap<String, Object> getTotalPostLikeCount(int post_no) {
		   HashMap<String, Object> map = new  HashMap<String, Object>();
		   
		   
		   map.put("result", "success");
		   map.put("data", postService.selectCountPostLike(post_no));
		   return map;
	   }
	   
	 @RequestMapping("restcheckPostLike")
	   public HashMap<String, Object> restcheckPostLike(PostLikeVo postLikeVo , HttpSession session){
		   HashMap<String, Object> map = new  HashMap<String, Object>();
		   
		   CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
		   int customer_no = customerVo.getCustomer_no();
		   postLikeVo.setCustomer_no(customer_no);
		   
		   map.put("result", "success");
		   map.put("data", postService.checkPostLike(postLikeVo));
		   
		   return map;
	   }
	 
	 
	 @RequestMapping("restPostDeleteProcess")
	   public HashMap<String, Object> restPostDeleteProcess(int post_no){
	      HashMap<String, Object> map = new HashMap<String, Object>();   
	      
	      postService.DeletePost(post_no);
	      
	      map.put("result", "success");
	      return map;
	   }
}
