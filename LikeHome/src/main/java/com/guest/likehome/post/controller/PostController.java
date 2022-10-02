package com.guest.likehome.post.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guest.likehome.post.service.PostServiceImpl;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.PostLikeVo;
import com.guest.likehome.vo.PostReportVo;
import com.guest.likehome.vo.PostScrapVo;

@Controller
@RequestMapping("/post/*")
public class PostController {

	
	@Autowired
	private PostServiceImpl postService;
	
	@RequestMapping("postRegisterPage")
	public String postRegisterPage(Model model) {
		
	HashMap<String, Object> PostCategory = postService.getPostCategory();
	model.addAttribute("PostCategory", PostCategory);	
		
		return "/post/postRegisterPage";
	}
	
	@RequestMapping("postListPage")
	public String postListPage(Model model, HttpSession session,
			String house_type_name, 
			String house_style_name, 
			String space_type_name, 
			String orderby) {
		
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		HashMap<String, Object> PostCategory = postService.getPostCategory();
		ArrayList<HashMap<String, Object>> data = postService.getPostList(house_type_name, house_style_name, space_type_name, orderby, customer_no);
				
		model.addAttribute("PostCategory", PostCategory);
		model.addAttribute("data", data);
		
		
		return "post/postListPage";
	}
	
	@RequestMapping("postDetailPage")
	public String postDetailPage(Model model, PostReportVo postReportVo , HttpSession session) {
		PostLikeVo postLikeVo = new PostLikeVo();
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		int post_no = postReportVo.getPost_no();
		postLikeVo.setPost_no(postReportVo.getPost_no());
		postLikeVo.setCustomer_no(customer_no);
		
		
		postReportVo.setCustomer_no(customer_no);
		postService.increasePostViews(post_no);
		
		PostReportVo postReport = postService.PostReport(postReportVo);
		HashMap<String, Object> data = postService.getPostDetail(post_no, customer_no);
		int postLikeCount = postService.selectCountPostLike(post_no);
		PostScrapVo postScrap = new PostScrapVo();
		postScrap.setCustomer_no(customer_no);
		postScrap.setPost_no(post_no);
		PostScrapVo postScrapVo = postService.checkPostScrap(postScrap);
		int postScrapCount = postService.CountPostScrap(post_no);
		
		model.addAttribute("postScrapCount",postScrapCount);
		model.addAttribute("postScrapVo",postScrapVo);
		model.addAttribute("postLikeCount",postLikeCount);
		model.addAttribute("postLike",postService.checkPostLike(postLikeVo));
		model.addAttribute("postReport", postReport);
		model.addAttribute("customerInfo", customerInfo);
		model.addAttribute("data", data);
		model.addAttribute("postNo", post_no);
		
		return "post/postDetailPage";
	}
	
	
	@RequestMapping("followPostListPage")
	public String followPostListPage(Model model, HttpSession session) {
		
		int customer_no = 0;
		
		if((CustomerVo)session.getAttribute("customerInfo") !=null) {
			CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
			customer_no = customerVo.getCustomer_no();
		}		
		
		ArrayList<HashMap<String, Object>> FollowPostdata = postService.getFollowPostList(customer_no);
		
		model.addAttribute("FollowPostdata", FollowPostdata);
		
		return "/post/followPostListPage";
	}
	
	@RequestMapping("postEditPage")
	public String postEditPage(HttpSession session,Model model, int post_no) {
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		HashMap<String, Object> PostCategory = postService.getPostCategory();
		HashMap<String, Object> data = postService.getPostDetail(post_no, customer_no);
		
		model.addAttribute("customerInfo", customerInfo);
		model.addAttribute("data", data);
		model.addAttribute("postNo", post_no);
		model.addAttribute("PostCategory", PostCategory);	
	
		return "post/postEditPage";
	}
	
	@RequestMapping("postDeleteProcess")
	public String PostDeleteProcess(int post_no){
		
		postService.DeletePost(post_no);
		
		return "redirect:./postListPage";
	}
	
	@RequestMapping("hashtagPostListPage")
	public String hashtagPostListPage(Model model, HttpSession session,
			String house_type_name, 
			String house_style_name, 
			String space_type_name, 
			String orderby) {
		
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		space_type_name = "3";
		HashMap<String, Object> PostCategory = postService.getPostCategory();
		ArrayList<HashMap<String, Object>> data = postService.getPostList(house_type_name, house_style_name, space_type_name, orderby, customer_no);
				
		model.addAttribute("PostCategory", PostCategory);
		model.addAttribute("data", data);
		
		
		return "post/hashtagPostListPage";
	}
	
	
	
	
	
	
	
}
