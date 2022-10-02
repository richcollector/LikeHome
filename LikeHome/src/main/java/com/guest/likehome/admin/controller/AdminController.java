package com.guest.likehome.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guest.likehome.admin.service.AdminServiceImpl;
import com.guest.likehome.help.service.HelpServiceImpl;
import com.guest.likehome.vo.AdminVo;
import com.guest.likehome.vo.CouponVo;
import com.guest.likehome.vo.HelpQnaVo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	HelpServiceImpl helpService;
	@Autowired
	AdminServiceImpl adminService;
	
	
	//계정 관련
	@RequestMapping("adminLoginPage")
	public String adminLoginPage() {
		return "/admin/adminLoginPage";
	}
	
	@RequestMapping("adminLoginProcess")
	public String adminLoginProcess(AdminVo adminVo, HttpSession session) {
		AdminVo adminInfo = adminService.adminLogin(adminVo);
		session.setAttribute("adminInfo", adminInfo);
		String authority ="2";
		session.setAttribute("authority", authority);
		return "/admin/adminMainPage";
	}
	
	@RequestMapping("adminLogOutProcess")
	public String adminLogOutProcess(HttpSession session) {
		session.invalidate();
		
		return "redirect:../admin/adminMainPage";
	}
	
	//고객센터
	@RequestMapping("helpQnaAnswerPage")
	public String helpQnaAnswerPage(int help_qna_no, Model model) {
		HashMap<String, Object> data = helpService.getHelpQnaData(help_qna_no);
		
		model.addAttribute("data", data);
		
		return "admin/helpQnaAnswerPage";
	}
	
	@RequestMapping("updateQnaAnswer")
	public String updateQnaAnswer(HelpQnaVo param) {
		helpService.updateQnaAnswer(param);
		return "redirect:../main/helpQnaBoardPage";
	}
	
	
	
	
	@RequestMapping("helpQnaAnsweredPage")
	public String helpQnaAnsweredPage(Model model ,String value, String searchType, String searchWord , @RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = helpService.getHelpQnaDataList(value);
		model.addAttribute("dataList" , dataList);

		return "admin/helpQnaAnsweredPage";
	}
	
	@RequestMapping("helpQnaNotAnsweredPage")
	public String helpQnaNotAnsweredPage(Model model ,String value, String searchType, String searchWord , @RequestParam(value = "pageNum",defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = helpService.getHelpQnaDataList(value);
		model.addAttribute("dataList" , dataList);
		
		return "admin/helpQnaNotAnsweredPage";
	}
	
	@RequestMapping("helpQnaBoardPage")
	public String helpQnaList(Model model , String value) {
		
		ArrayList<HashMap<String, Object>> dataList = helpService.getHelpQnaDataList(value);
		model.addAttribute("dataList" , dataList);
		

		return "admin/helpQnaBoardPage";
	}
	
	
	
	//관리자 쿠폰
	@RequestMapping("adminCouponListPage")
	public String adminCouponListPage(Model model) {
		//ArrayList<CouponVo> data = adminService.getCouponData();
		//model.addAttribute("dataCouponList", data);
		ArrayList<CouponVo> couponList = adminService.getAdminCouponList();
		model.addAttribute("couponList", couponList);
		return "/admin/adminCouponListPage";
	}
	  
	//쿠폰 생성
	@RequestMapping("writeCouponPage")
	public String writeCouponPage() {
		return "/admin/writeCouponPage";
	}
	  
	@RequestMapping("writeCouponProcess")
	public String writeCouponProcess(CouponVo param) {
		adminService.insertCoupon(param);
		return "redirect:./adminCouponListPage";
	}
	
	@RequestMapping("deleteCouponProcess")
	public String deleteCouponProcess(int coupon_no) {
		adminService.deleteCoupon(coupon_no);
		return "redirect:./adminCouponListPage";
	}
	
	
	
	//관리자페이지
	@RequestMapping("adminMainPage")
	public String adminMainPage(Model model, String searchType, String searchWord,
			 String searchTypeCustomer, String searchWordCustomer) {
		ArrayList<VendorVo> vendorVoList = adminService.selectVendor("T", searchType, searchWord);
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<HashMap<String, Object>> customerVoList = adminService.selectByCustomerInfo(searchTypeCustomer,searchWordCustomer);
		model.addAttribute("customerVoList",customerVoList);
		
		for(VendorVo vendorVo : vendorVoList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				int vendor_no = vendorVo.getVendor_no();
				int productCount = adminService.countVendorProduct(vendor_no);
				map.put("vendorVo", vendorVo);
				map.put("productCount", productCount);
				dataList.add(map);
		}
		
		model.addAttribute("dataList", dataList);

		return "/admin/adminMainPage";
	}
	
	@RequestMapping("adminVendorListPage")
	public String adminVendorListPage(Model model, HttpSession session, 
			String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		ArrayList<VendorVo> vendorVo = adminService.selectByVendorInfo(searchType, searchWord, pageNum);
		model.addAttribute("vendorVo",vendorVo);
		
		int vendorCount = adminService.getVendorCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(vendorCount/10.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum);
		model.addAttribute("totalPageCount",totalPageCount);
		
		//링크유지
		String additionalParam = "";
		if(searchType != null && searchWord != null) {
			additionalParam += "&searchType=" +searchType;
			additionalParam += "&searchWord=" +searchWord;
		}
		
		model.addAttribute("additionalParam",additionalParam);
		
		return "/admin/adminVendorListPage";
	}
	
	@RequestMapping("adminTotalProductListPage")
	public String adminTotalProductListPage (Model model, HttpSession session, 
			String searchType, String searchWord,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> productCatagotyList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ProductVo> productVoList = adminService.selectProduct(searchType,searchWord,pageNum);
		
		for(ProductVo productVo : productVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int product_category2_no = productVo.getProduct_category2_no();
			ArrayList<ProductCategory2Vo> categoy2List = adminService.selectCategory2(product_category2_no);
			
			for(ProductCategory2Vo productCategory2Vo : categoy2List) {
				String category2Name =  productCategory2Vo.getProduct_category2_name();
				map.put("productVo", productVo);
				map.put("category2Name", category2Name);
				productCatagotyList.add(map);
			}
		}
		
		
		model.addAttribute("productCatagotyList", productCatagotyList);
		
		
		int productCount = adminService.getProductCount(searchType, searchWord);
		//올림처리
		int totalPageCount = (int)Math.ceil(productCount/10.0);

		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPageNum",pageNum);
		model.addAttribute("totalPageCount",totalPageCount);
		
		//링크유지
		String additionalParam = "";
		if(searchType != null && searchWord != null) {
			additionalParam += "&searchType=" +searchType;
			additionalParam += "&searchWord=" +searchWord;
		}
		
		model.addAttribute("additionalParam",additionalParam);
		
		return "admin/adminTotalProductListPage";
	}
	
	@RequestMapping("deleteProductProcess")
	public String deleteProductProcess(int product_no) {
		adminService.deleteProduct(product_no);
		
		return "redirect:../admin/adminTotalProductListPage";

	}
	
}
