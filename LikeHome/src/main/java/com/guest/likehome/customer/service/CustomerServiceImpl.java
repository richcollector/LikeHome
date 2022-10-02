package com.guest.likehome.customer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.post.mapper.PostSQLMapper;
import com.guest.likehome.product.mapper.ProductSQLMapper;
import com.guest.likehome.product.service.ProductServiceImpl;
import com.guest.likehome.vendor.mapper.VendorSQLMapper;
import com.guest.likehome.vo.AddressVo;
import com.guest.likehome.vo.CouponVo;
import com.guest.likehome.vo.CustomerCouponVo;
import com.guest.likehome.vo.CustomerMailAuthVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.FollowVo;
import com.guest.likehome.vo.PostLikeVo;
import com.guest.likehome.vo.PostScrapVo;
import com.guest.likehome.vo.PostVo;
import com.guest.likehome.vo.ProductScrapVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.SubpostVo;
import com.guest.likehome.vo.VendorVo;

@Service
public class CustomerServiceImpl {

	@Autowired
	private CustomerSQLMapper customerSQLMapper;
	@Autowired
	private ProductSQLMapper productSQLMapper;
	@Autowired
	private VendorSQLMapper vendorSQLMapper;
	@Autowired
	private PostSQLMapper postSQLMapper;
	@Autowired
	private JavaMailSender javaMailSender; 
	////계정
	
	//고객등록 진행
		public void customerRegister(CustomerVo customerVo) {
			customerSQLMapper.insertCustomer(customerVo);
			
			//인증 메일 전송
			try {
				MimeMessage mimeMessage = javaMailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
				
				mimeMessageHelper.setSubject("[LikeHome] 회원가입을 축하드립니다.");
				
				String uuid = UUID.randomUUID().toString();
				
				String text = "";
				text += customerVo.getCustomer_nick() + "님 회원가입을 축하합니다.";
				//text += "인증번호 :" + uuid;
				text += "<br>아래에 인증하기 링크를 클릭하셔서 인증 후 사이트 이용이 가능합니다.<br>";
				text += "<br><a href='http://http://15.164.165.147:8080/LikeHome/customer/mailAuthProcess?auth_Key="+uuid+"'>";
				text += "인증하고 로그인하기";
				text += "</a>";
				
				mimeMessageHelper.setText(text , true);
				mimeMessageHelper.setFrom("admin", "LH 관리자");
				mimeMessageHelper.setTo(customerVo.getCustomer_email());
				
				javaMailSender.send(mimeMessage);
				
				CustomerMailAuthVo customerMailAuthVo = new CustomerMailAuthVo();
				customerMailAuthVo.setCustomer_no(customerVo.getCustomer_no());
				customerMailAuthVo.setAuth_key(uuid);
				customerSQLMapper.insertCustomerMailAuth(customerMailAuthVo);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	
	//로그인 진행
	public CustomerVo customerLogin(CustomerVo customerVo) {
		
		CustomerVo result = customerSQLMapper.selectByEmailAndPw(customerVo);
		
		return result;
	}
	
	//고객정보 가져오기
	public CustomerVo getCustomerNo(int customerNo){
		return customerSQLMapper.selectCustomerByCustomerNo(customerNo);
	}
	
	public boolean countSelectcustomerId(String customer_email) {
	      
      if(customerSQLMapper.countSelectcustomerId(customer_email) > 0) {
         return true;
      }else {
         return false;
      }
      
   }
	   
   public boolean countSelectcustomerPw(String customer_email,String customer_pw) {
      
      if(customerSQLMapper.countSelectcustomerPw(customer_email,customer_pw) > 0) {
         return true;
      }else {
         return false;
      }
   }
   
   public void updateCustomer(CustomerVo customerVo) {
	   customerSQLMapper.updateCustomer(customerVo);
   }

   public void updateCustomerPw(CustomerVo customerVo) {
	   customerSQLMapper.updateCustomerPw(customerVo);
   }
	
	   
	   

	////주소
	
	public void getWriteAddressContentList(AddressVo addressVo) {
		customerSQLMapper.insertAddress(addressVo);
	}
	
	//주소 사용자 번호
	public ArrayList<AddressVo> getCustomerAddressList(int customerNo) {
		return customerSQLMapper.selectAddressByAddressCustomerNo(customerNo);
	}
	
	
	//주소 가져오기
	public AddressVo getAddress(int addressNo) {
		return customerSQLMapper.selectAddressByAddressNo(addressNo);
	}
	
	public HashMap<String, Object> getAddressNo(int addressNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		AddressVo addressVo = customerSQLMapper.selectAddressByAddressNo(addressNo);
		
		int customerNo = addressVo.getCustomer_no();
		
		CustomerVo customerVo = customerSQLMapper.selectCustomerByCustomerNo(customerNo);
		
		map.put("CustomerVo", customerVo);
		map.put("AddressVo", addressVo);
		
		return map;
	}
	
	public void deleteAddressContent(int addressNo) {
		customerSQLMapper.deleteAddressByAddressNo(addressNo);
	}
	
	public void updateAddressContent(AddressVo addressVo) {
		customerSQLMapper.updateAddress(addressVo);
	}
	

	
	////상품
	public ArrayList<HashMap<String, Object>> getProductScrapList(int customerNo){
		
		ArrayList<HashMap<String, Object>> productScrapDataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ProductScrapVo> productScrapVoList = productSQLMapper.selectProductScrapByCustomerNo(customerNo);
		
		for(ProductScrapVo productScrapVo : productScrapVoList) {
			
			int productNo = productScrapVo.getProduct_no();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ProductVo productVo = productSQLMapper.selectProductByProductNo(productNo);
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
			ProductTitleImageVo productTitleImageVo = vendorSQLMapper.selectByTitleImage(productVo.getProduct_no()).get(0);
			
			map.put("vendorVo", vendorVo);
			map.put("productVo", productVo);
			map.put("productTitleImageVo", productTitleImageVo);
			
			productScrapDataList.add(map);
		}
		return productScrapDataList;
	}
	
	
	
	
	////쿠폰
	
	//내쿠폰함
	public ArrayList<HashMap<String, Object>> getCustomerCouponList(int customerNo) {
		
		ArrayList<HashMap<String, Object>> CustomerCouponDataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<CustomerCouponVo> customerCouponVoList = customerSQLMapper.selectCustomerCouponByCustomerNo(customerNo);
		
		for(CustomerCouponVo customerCouponVo : customerCouponVoList) {
			int couponNo = customerCouponVo.getCoupon_no();
			CouponVo couponVo = customerSQLMapper.selectCouponByCouponNo(couponNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("couponVo", couponVo);
			map.put("customerCouponVo", customerCouponVo);
			CustomerCouponDataList.add(map);
		}	
			return CustomerCouponDataList;
	}

	public void CustomerCouponContentList(CustomerCouponVo customerCouponVo) {
		customerSQLMapper.insertCustomerCoupon(customerCouponVo);
	}
	
	public int getCustomerCouponCount(CustomerCouponVo customerCouponVo) {
		
		return customerSQLMapper.selectCustomerCouponByCouponNoAndCustomerNo(customerCouponVo);
	}

	public void getCustomerCouponContentList(CustomerCouponVo customerCouponVo) {
		customerSQLMapper.insertCustomerCoupon(customerCouponVo);
	}
	
	public ArrayList<CouponVo> getMyCouponList(int customerNo) {
		return customerSQLMapper.selectCouponByCustomerNo(customerNo);
	}
	

	////커뮤니티

	public void FollowCustomer(int follower_no, int followee_no) {
		FollowVo followVo = customerSQLMapper.selectFollowByFollowerAndFollowee(follower_no, followee_no);
		
		if(null == followVo) {
			customerSQLMapper.insertFollow(follower_no, followee_no);
		}else {
			customerSQLMapper.deleteFollowByFollowerNoAndFolloweeNo(follower_no, followee_no);
		}
	}
	
	public FollowVo hasFollow(int follower_no, int followee_no) {
		return customerSQLMapper.selectFollowByFollowerAndFollowee(follower_no, followee_no);
	}
	
	public int followCount(int customer_no) {
		return customerSQLMapper.selectCountFollowByFolloweeNo(customer_no);
	}
	
	public int followingCount(int customer_no) {
		return customerSQLMapper.selectCountFollowByFollowerNo(customer_no);
	}
	
	
	public HashMap<String, Object> userHomeData(int customer_no, int userNo){
		HashMap<String, Object> userData = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> postDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> followerDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> followingDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<CustomerVo> followerList = customerSQLMapper.selectCustomerByFolloweeNo(userNo);
		ArrayList<CustomerVo> followingList = customerSQLMapper.selectCustomerByFollowerNo(userNo);
		ArrayList<PostVo> postList = postSQLMapper.selectPostListByPostCustomerNo(userNo);
		CustomerVo userInfo = customerSQLMapper.selectCustomerByCustomerNo(userNo);
		for(PostVo postVo:postList) {
			ArrayList<SubpostVo> subpostList = postSQLMapper.selectSubPostByPostNo(postVo.getPost_no());
			SubpostVo subpostVo = subpostList.get(0);
			int postLikeCount = postSQLMapper.selectCountPostLike(postVo.getPost_no());
			int postScrapCount = postSQLMapper.selectCountPostScrap(postVo.getPost_no());
			int postCommentCount = postSQLMapper.selectCountPostComment(postVo.getPost_no());
			PostLikeVo postLikeVo = postSQLMapper.selectPostLikeByPostNoAndCustomerNo(customer_no, postVo.getPost_no());
			PostScrapVo postScrap = new PostScrapVo();
			postScrap.setCustomer_no(customer_no);
			postScrap.setPost_no(postVo.getPost_no());
			PostScrapVo postScrapVo = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrap);
			CustomerVo customerVo = postSQLMapper.selectCustomerVoByPostNo(postVo.getPost_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("customerVo", customerVo);
			map.put("postScrapVo", postScrapVo);
			map.put("postLikeVo", postLikeVo);
			map.put("postCommentCount", postCommentCount);
			map.put("postScrapCount", postScrapCount);
			map.put("postLikeCount", postLikeCount);
			map.put("subpostVo", subpostVo);
			map.put("postVo", postVo);
			postDataList.add(map);
		}
		
		for(CustomerVo customerVo : followerList) {
			FollowVo followVo = customerSQLMapper.selectFollowByFollowerAndFollowee(customer_no, customerVo.getCustomer_no());
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("followVo", followVo);
			map.put("customerVo", customerVo);
			followerDataList.add(map);
		}
		
		for(CustomerVo customerVo : followingList) {
			FollowVo followVo = customerSQLMapper.selectFollowByFollowerAndFollowee(customer_no, customerVo.getCustomer_no());
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("followVo", followVo);
			map.put("customerVo", customerVo);
			followingDataList.add(map);
		}
		
		int followerCount = customerSQLMapper.selectCountFollowByFolloweeNo(userNo);
		int followingCount = customerSQLMapper.selectCountFollowByFollowerNo(userNo);
		int postCount = postSQLMapper.selectCountPostByCustomerNo(userNo);
		
		userData.put("postCount", postCount);
		userData.put("followerDataList", followerDataList);
		userData.put("followingDataList", followingDataList);
		userData.put("postDataList", postDataList);
		userData.put("followerCount", followerCount);
		userData.put("followingCount", followingCount);
		userData.put("userInfo", userInfo);
		return userData;
	}
	
	public HashMap<String, Object> myHomeData(int customer_no){
		HashMap<String, Object> myData = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> postDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> postLikeDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> postScrapDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> productScrapDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> followerDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> followingDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<CustomerVo> followerList = customerSQLMapper.selectCustomerByFolloweeNo(customer_no);
		ArrayList<CustomerVo> followingList = customerSQLMapper.selectCustomerByFollowerNo(customer_no);
		ArrayList<PostVo> postList = postSQLMapper.selectPostListByPostCustomerNo(customer_no);
		ArrayList<ProductScrapVo> productScrapList = productSQLMapper.selectProductScrapByCustomerNo(customer_no);
		ArrayList<PostScrapVo> postScrapList = postSQLMapper.selectPostScrapByCustomerNo(customer_no);
		ArrayList<PostLikeVo> postLikeList = postSQLMapper.selectPostLikeBycustomerNo(customer_no);

		for(PostVo postVo:postList) {
			ArrayList<SubpostVo> subpostList = postSQLMapper.selectSubPostByPostNo(postVo.getPost_no());
			SubpostVo subpostVo = subpostList.get(0);
			int postLikeCount = postSQLMapper.selectCountPostLike(postVo.getPost_no());
			int postScrapCount = postSQLMapper.selectCountPostScrap(postVo.getPost_no());
			int postCommentCount = postSQLMapper.selectCountPostComment(postVo.getPost_no());
			PostLikeVo postLikeVo = postSQLMapper.selectPostLikeByPostNoAndCustomerNo(customer_no, postVo.getPost_no());
			PostScrapVo postScrap = new PostScrapVo();
			postScrap.setCustomer_no(customer_no);
			postScrap.setPost_no(postVo.getPost_no());
			PostScrapVo postScrapVo = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrap);
			CustomerVo customerVo = postSQLMapper.selectCustomerVoByPostNo(postVo.getPost_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("customerVo", customerVo);
			map.put("postScrapVo", postScrapVo);
			map.put("postLikeVo", postLikeVo);
			map.put("postCommentCount", postCommentCount);
			map.put("postScrapCount", postScrapCount);
			map.put("postLikeCount", postLikeCount);
			map.put("subpostVo", subpostVo);
			map.put("postVo", postVo);
			postDataList.add(map);
		}
		
		for(CustomerVo customerVo : followerList) {
			FollowVo followVo = customerSQLMapper.selectFollowByFollowerAndFollowee(customer_no, customerVo.getCustomer_no());
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("followVo", followVo);
			map.put("customerVo", customerVo);
			followerDataList.add(map);
		}
		
		for(CustomerVo customerVo : followingList) {
			FollowVo followVo = customerSQLMapper.selectFollowByFollowerAndFollowee(customer_no, customerVo.getCustomer_no());
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("followVo", followVo);
			map.put("customerVo", customerVo);
			followingDataList.add(map);
		}
		
		for(ProductScrapVo productScrapVo : productScrapList) {
			ArrayList<ProductTitleImageVo> productTitleImageVos = vendorSQLMapper.selectByTitleImage(productScrapVo.getProduct_no());
			String productTitleImage = productTitleImageVos.get(0).getTitle_image_link();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("productTitleImage",productTitleImage);
			map.put("productScrapVo",productScrapVo);
			productScrapDataList.add(map);
			
		}
		
		for(PostScrapVo postScrapVo : postScrapList) {
			ArrayList<SubpostVo> subPostVos = postSQLMapper.selectSubPostByPostNo(postScrapVo.getPost_no());
			String subPostImage = subPostVos.get(0).getSubpost_image_link();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("subPostImage", subPostImage);
			map.put("postScrapVo", postScrapVo);
			postScrapDataList.add(map);
			
		}
		
		for(PostLikeVo postLikeVo : postLikeList) {
			ArrayList<SubpostVo> subpostVos = postSQLMapper.selectSubPostByPostNo(postLikeVo.getPost_no());
			String subPostImage = subpostVos.get(0).getSubpost_image_link();
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("subPostImage", subPostImage);
			map.put("postLikeVo", postLikeVo);
			
			postLikeDataList.add(map);
		}
		
		int followerCount = customerSQLMapper.selectCountFollowByFolloweeNo(customer_no);
		int followingCount = customerSQLMapper.selectCountFollowByFollowerNo(customer_no);
		int postLikeCount = postSQLMapper.selectCountPostLikeByCustomerNo(customer_no);
		int postScrapCount = postSQLMapper.selectCountPostScrapByCustomerNo(customer_no);
		int productScrapcount = productSQLMapper.selectCountProductScrapByCustomerNo(customer_no);
		int postCount = postSQLMapper.selectCountPostByCustomerNo(customer_no);
		
		myData.put("followerDataList", followerDataList);
		myData.put("followingDataList", followingDataList);
		myData.put("postDataList", postDataList);
		myData.put("productScrapDataList", productScrapDataList);
		myData.put("postScrapDataList", postScrapDataList);
		myData.put("postLikeDataList", postLikeDataList);
		myData.put("postCount", postCount);
		myData.put("followerCount", followerCount);
		myData.put("followingCount", followingCount);
		myData.put("postLikeCount", postLikeCount);
		myData.put("postScrapCount", postScrapCount);
		myData.put("productScrapcount", productScrapcount);
		return myData;
	}
	
	
	public boolean isExistEmail(String customer_email) {
		
		if(customerSQLMapper.selectCustomerCountByEmail(customer_email) > 0) {
			return true;
		}else {
			return false;
		}
	}

	
	public boolean selectByAuth(String customer_email , String customer_pw) {
		
		CustomerMailAuthVo customerMailAuthVo = customerSQLMapper.selectByAuth(customer_email,customer_pw);
		
		if(customerMailAuthVo != null) {
			if(customerMailAuthVo.getAuth_complete().equals("Y")) {
				return true;
			}else {
				return false;
			}
		}else if(customerMailAuthVo == null) {
			return true;
		}
		return true;
	}
	
	public void customerMailAuth(String auth_Key) {
		customerSQLMapper.updateCompleteY(auth_Key);
	}
	
	
}
