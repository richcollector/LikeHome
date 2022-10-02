package com.guest.likehome.customer.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.guest.likehome.admin.service.AdminServiceImpl;
import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.customer.service.CustomerServiceImpl;
import com.guest.likehome.help.service.HelpServiceImpl;
import com.guest.likehome.order.service.OrderServiceImpl;
import com.guest.likehome.product.service.ProductServiceImpl;
import com.guest.likehome.vo.AddressVo;
import com.guest.likehome.vo.CouponVo;
import com.guest.likehome.vo.CustomerCouponVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.FollowVo;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {

	
	@Autowired
	private CustomerServiceImpl customerService;
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private OrderServiceImpl orderService;
	@Autowired
	private HelpServiceImpl helpService;
	@Autowired
	private CustomerSQLMapper customerSQLMapper;
	
	
	@RequestMapping("customerLoginPage")
	public String customerLoginPage() {
		
		return "customer/customerLoginPage";
	}
	
	
	////일반회원 계정
	
	//일반회원 회원가입페이지 이동
	@RequestMapping("customerRegisterPage")
	public String customerRegisterPage() {
		
		return "customer/customerRegisterPage";
	}
	
   //일반회원 회원가입 진행
	@RequestMapping("customerRegisterProcess")
   public String customerRegisterProcess(CustomerVo customerVo, 
                              HttpSession session, MultipartFile [] profile_image) {

	  int customerPk = customerSQLMapper.createCustomerPk();
	  
	  for(MultipartFile file : profile_image) {
	     
	     if(file.isEmpty()) {
	        continue;
	     }
     
	     //프로필 폴더 생성
	     String folderName = "/uploadFiles/customerIntro/";
         File introFolder = new File(folderName);
		 if(!introFolder.exists()) {
			 introFolder.mkdirs();
		 }
		 
		 String originalFileName = file.getOriginalFilename();
		 
		 String randomName = UUID.randomUUID().toString();
		 randomName += "_" + System.currentTimeMillis();
		 String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		     randomName += ext;
		     customerVo.setCustomer_profile_image(randomName);
		     
		     try {
		        file.transferTo(new File(folderName + randomName));
		     }catch(Exception e) {
		        e.printStackTrace();
		     }
		     
		  }
	  	  customerVo.setCustomer_no(customerPk);
		  customerService.customerRegister(customerVo);

		  
		  return "/customer/customerLoginPage";
		   }
	
	@RequestMapping("customerLoginProcess")
	public String customerLoginProcess(CustomerVo customerVo, HttpSession session) {
		
		CustomerVo customerInfo = customerService.customerLogin(customerVo);
		session.setAttribute("customerInfo", customerInfo);
		String authority = "0";
		session.setAttribute("authority", authority);
		return "redirect: ../main/mainPage";
	}
	
	
	@RequestMapping("customerLogoutProcess")
	public String customerLogoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return "redirect: ../main/mainPage";
	}
	
	
	@RequestMapping("updateCustomerProcess")
	public String updateCustomerProcess (CustomerVo customerVo, HttpSession session, 
										String ex_profile_image, MultipartFile [] profile_image) {
		
		
		for(MultipartFile file : profile_image) {
	         
	         if(file.isEmpty()) {
	            continue;
	         }
	         
	         //프로필 폴더 생성
	         String folderName = "/uploadFiles/customerIntro/";
	         File introFolder = new File(folderName);
			 if(!introFolder.exists()) {
				 introFolder.mkdirs();
			 }
			 
	         String originalFileName = file.getOriginalFilename();
	         
	         customerVo.setCustomer_profile_image(ex_profile_image);
	         
	         try {
	            file.transferTo(new File(folderName + ex_profile_image));
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	         
	      }
		customerService.updateCustomer(customerVo);
		session.invalidate();
		
		return "redirect: ../main/mainPage";
	}

	@RequestMapping("updateCustomerPwProcess")
	public String updateCustomerPwProcess (CustomerVo customerVo, HttpSession session) {
		customerService.updateCustomerPw(customerVo);
		session.invalidate();
		
		return "redirect: ../main/mainPage";
	}
	
	@RequestMapping("mailAuthProcess")
	public String mailAuthProcess(String auth_Key) {
		
		customerService.customerMailAuth(auth_Key);
		
		return "customer/customerLoginPage";
	}
	
	
	
	////주소
	
	@RequestMapping("addressListPage") 
	public String addressListPage(Model model, HttpSession session) { 
		
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		int addressCustomerNo = customerInfo.getCustomer_no();
		    			
		ArrayList<AddressVo> data = customerService.getCustomerAddressList(addressCustomerNo);
		
		model.addAttribute("data", data);

		
		return "/customer/addressListPage";
	}
					
	@RequestMapping("writeAddressPage") // 주소 쓰기 페이지
	public String writeAddressPage() {	
		return "/customer/writeAddressPage";
	}
			
	@RequestMapping("writeAddressProcess") //주소 등록
	public String writeAddressProcess(AddressVo param, HttpSession session) {
		//사용자 정보 가져오기               
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
                                                                                                                                                                                              					                                                      
		int customerNo = customerInfo.getCustomer_no();                                                                      
		param.setCustomer_no(customerNo);                                                                                                          
		customerService.getWriteAddressContentList(param);                                                                                     
		                                       
		return "redirect:./addressListPage";     							
	}

	//삭제
	@RequestMapping("deleteContentProcess")
	public String deleteContentProcess(int address_no) {
		customerService.deleteAddressContent(address_no);
		return "redirect:./addressListPage";
	}
	//수정페이지
	@RequestMapping("updateAddressPage")
	public String updateContentPage(int address_no, Model model) {
		
		HashMap<String, Object> data = customerService.getAddressNo(address_no);
		model.addAttribute("data", data);
		
		
		return "/customer/updateAddressPage";	
	}
	
	//수정하기
	@RequestMapping("updateContentProcess")
	public String updateContentProcess(AddressVo param) {
		System.out.println("dddddd");
		customerService.updateAddressContent(param);
		
		
		return "redirect:./addressListPage";
	}
	
	
	
	////쿠폰
	
	@RequestMapping("customerCouponListPage")
	public String customerCouponListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> getCouponDataList = adminService.getCouponData();
		
		model.addAttribute("getCouponDataList", getCouponDataList);
		//ArrayList<HashMap<String, Object>> getCoupondataList = customerService.getCoupondataList(customerNo);
		
		
		return "/customer/customerCouponListPage";
	}
	
	//발급받은 쿠폰 마이페이지 
	@RequestMapping("customerMyCouponPage")
	public String customerMyCouponPage(HttpSession session, Model model) {
		//System.out.println(param.getCoupon_no());
		
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = customerInfo.getCustomer_no();
		
		model.addAttribute("CustomerCouponDataList", customerService.getCustomerCouponList(customerNo));
		
		return "/customer/customerMyCouponPage";
	}
	

	////커뮤니티
	@RequestMapping("userHomePage")
	public String userHomePage(HttpSession session, Model model,int userNo) {
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		HashMap<String, Object> data = customerService.userHomeData(customer_no,userNo);
		FollowVo followVo = customerService.hasFollow(customer_no,userNo);
		
		model.addAttribute("followVo", followVo);
		model.addAttribute("data", data);
		return "/customer/userHomePage";
	}
	
	
	
	
	
	////마이페이지
	
	//마이페이지-프로필-마이홈 페이지
	@RequestMapping("customerProfileMyHomePage")
	public String customerProfileMyHome(HttpSession session, Model model) {
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		
		HashMap<String, Object> data = customerService.myHomeData(customer_no);
		
		model.addAttribute("data", data);
		return "customer/customerProfileMyHomePage";
	}
	
	//마이페이지-프로필-사진 페이지
	@RequestMapping("customerProfileMyPhotoPage")
	public String customerProfileMyPhotoPage() {
		return "customer/customerProfileMyPhotoPage";
	}
	
	
	//마이페이지-프로필-스크랩 페이지
	@RequestMapping("customerProfileMyPostScrapPage")
	public String customerProfileMyPostScrapPage(HttpSession session, Model model) {
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		
		HashMap<String, Object> data = customerService.myHomeData(customer_no);
		
		model.addAttribute("data", data);
		return "customer/customerProfileMyPostScrapPage";
	}
	
	//마이페이지-프로필-좋아요 페이지
	@RequestMapping("customerProfileMyLikePage")
	public String customerProfileMyLikePage(HttpSession session, Model model) {
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		
		HashMap<String, Object> data = customerService.myHomeData(customer_no);
		
		model.addAttribute("data", data);
		return "customer/customerProfileMyLikePage";
	}
	
	//마이페이지-쇼핑-주문내역
	@RequestMapping("customerShoppingStatePage")
	public String customerShoppingStatePage(
			HttpSession session, 
			Model model,
			@RequestParam(value= "deliveryStatus", defaultValue = "3") int deliveryStatus
			) {
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); //주문자 CustomerNo 추출
		
		model.addAttribute("dataList", orderService.getOrderList(customerNo, deliveryStatus));
		model.addAttribute("deliveryStatus", deliveryStatus);
		
		return "customer/customerShoppingStatePage";
	}
		
	//마이페이지-나의쇼핑-상품스크랩북 페이지
	@RequestMapping("customerShoppingProductScrapPage")
	public String customerShoppingProductScrapPage(HttpSession session, Model model) {
		
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = customerInfo.getCustomer_no();                                                                      
		
		model.addAttribute("productScrapDataList", customerService.getProductScrapList(customerNo));
		model.addAttribute("customerInfo", customerInfo);
		model.addAttribute("productCategory1List", productService.getProductCategory1List());
		
		return "/customer/customerShoppingProductScrapPage";
	}
	
	
	
	//마이페이지-나의쇼핑-상품문의내역 페이지
	@RequestMapping("customerShoppingProductQnaPage")
	public String customerShoppingProductQnaPage() {
		return "customer/customerShoppingProductQnaPage";
	}
	
	//마이페이지-나의쇼핑-리뷰관리 페이지
	@RequestMapping("customerShoppingProductReviewPage")
	public String customerShoppingProductReviewPage() {
		return "customer/customerShoppingProductReviewPage";
	}
	
	//마이페이지-나의쇼핑-포인트 페이지
	@RequestMapping("customerShoppingPointPage")
	public String customerShoppingPointPage() {
		return "customer/customerShoppingPointPage";
	}
	
	//마이페이지-나의쇼핑-구매등급 페이지
	@RequestMapping("customerShoppingGradePage")
	public String customerShoppingGradePage() {
		return "customer/customerShoppingGradePage";
	}
	
	//마이페이지-나의쇼핑-고객센터 페이지
	@RequestMapping("customerShoppingHelpPage")
	public String customerShoppingHelpPage() {
		return "customer/customerShoppingHelpPage";
	}
	
	//마이페이지-나의쇼핑-문의하기 페이지
	@RequestMapping("customerMyHelpQnaPage")
	public String customerMyHelpQnaPage(Model model , String value , HttpSession session) {
	      
	    CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
	    ArrayList<HashMap<String, Object>> dataList = helpService.getHelpQnaDataList(value);
	    model.addAttribute("dataList" , dataList);
	    model.addAttribute("customerInfo" , customerInfo);

	    return "customer/customerMyHelpQnaPage";
	}
	
	//마이페이지-설정-회원정보수정 페이지
	@RequestMapping("customerInfoSettingPage")
	public String customerInfoSettingPage() {
		return "customer/customerInfoSettingPage";
	}

	//마이페이지-설정-비밀번호 변경 페이지
	@RequestMapping("customerPasswordUpdatePage")
	public String customerPasswordUpdatePage() {
		return "customer/customerPasswordUpdatePage";
	}


}
