package com.guest.likehome.post.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.post.mapper.PostSQLMapper;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.FollowVo;
import com.guest.likehome.vo.HashtagVo;
import com.guest.likehome.vo.HouseStyleVo;
import com.guest.likehome.vo.HouseTypeVo;
import com.guest.likehome.vo.NestedCommentLikeVo;
import com.guest.likehome.vo.NestedCommentVo;
import com.guest.likehome.vo.PostCommentLikeVo;
import com.guest.likehome.vo.PostLikeVo;
import com.guest.likehome.vo.PostReportVo;
import com.guest.likehome.vo.PostScrapVo;
import com.guest.likehome.vo.PostVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.PostCommentVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.SpaceTypeVo;
import com.guest.likehome.vo.SubpostProductVo;
import com.guest.likehome.vo.SubpostVo;
import com.guest.likehome.vo.SubpostHashtagVo;

@Service
public class PostServiceImpl {

	@Autowired
	private PostSQLMapper postSQLMapper;
	
	@Autowired
	private CustomerSQLMapper customerSQLMapper;
	
	//포스트 등록
	public void registerPost(PostVo postVo) {
		
		postSQLMapper.insertPost(postVo);
		
	}
	//서브포스트 등록
	public void RegisterSubPost(SubpostVo subPosts) {
		
		postSQLMapper.inserSubPost(subPosts);
	}
	
	//포스트 카테고리 데이터
	public HashMap<String, Object> getPostCategory(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		ArrayList<HouseTypeVo> houseTypeDataList = postSQLMapper.selectHouseTypeAll();
		ArrayList<HouseStyleVo> houseStyleDataList = postSQLMapper.selectHouseStyleAll();
		ArrayList<SpaceTypeVo> spaceTypeDataList = postSQLMapper.selectSpaceTypeAll();
		
		map.put("houseTypeDataList", houseTypeDataList);
		map.put("houseStyleDataList", houseStyleDataList);
		map.put("spaceTypeDataList", spaceTypeDataList);
		
		return map;
	}
	
	//포스트리스트 데이터
	public ArrayList<HashMap<String, Object>> getPostList(
			String house_type_no, String house_style_no, String space_type_no, String orderby, int customer_no){
		ArrayList<HashMap<String, Object>> PostDataList = new ArrayList<HashMap<String,Object>>();
		int houseTypeNo =0;
		int houseStyleNo =0;
		int spaceTypeNo =0;
		
		if((house_type_no ==null) || (house_type_no.equals("0"))) {
			houseTypeNo= 0;
		}else {
			houseTypeNo = Integer.parseInt(house_type_no);
		}
		if((house_style_no ==null) || (house_style_no.equals("0"))) {
			houseStyleNo = 0;
		}else {
			houseStyleNo = Integer.parseInt(house_style_no);
		}
		if((space_type_no ==null) || (space_type_no.equals("0"))) {
			spaceTypeNo=0;
		}else {
			spaceTypeNo = Integer.parseInt(space_type_no);
		}
		if(orderby ==null) {
			orderby="null";
		}
		ArrayList<PostVo> PostList = postSQLMapper.selectPostAll(houseTypeNo, houseStyleNo, spaceTypeNo, orderby);
		for(PostVo postVo : PostList) {
			int post_no = postVo.getPost_no(); 
			ArrayList<SubpostVo> subPostList = postSQLMapper.selectSubPostByPostNo(post_no);
			SubpostVo subPostVo = subPostList.get(0);
			PostScrapVo postScrap = new PostScrapVo();
			postScrap.setCustomer_no(customer_no);
			postScrap.setPost_no(post_no);
			PostScrapVo postScrapVo = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrap);
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("postVo", postVo);
			map.put("subPostVo", subPostVo);
			map.put("postScrapVo", postScrapVo);
			PostDataList.add(map);
		}
		
		return PostDataList;
	}
	
	//서브포스트 데이터
	public HashMap<String, Object> getPostDetail(int post_no, int customer_no){
		HashMap<String, Object> map = new HashMap<String,Object>();
		ArrayList<HashMap<String, Object>> subPostDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> customerSubPostDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> postCommentDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> nestedCommentDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<SubpostVo> subPostList = postSQLMapper.selectSubPostByPostNo(post_no);
		ArrayList<PostCommentVo> postCommentList = postSQLMapper.selectPostCommentListByPostNo(post_no);
		CustomerVo postCustomerVo = postSQLMapper.selectCustomerVoByPostNo(post_no);
		ArrayList<PostVo> customerPostList = postSQLMapper.selectPostListByPostCustomerNo(postCustomerVo.getCustomer_no());
		PostVo postVo = postSQLMapper.selectPostByPostNo(post_no);
		String houseTypeName = postSQLMapper.selectHouseTypeNameByPostNo(post_no);
		String houseStyleName = postSQLMapper.selectHouseStyleNameByPostNo(post_no);
		int postCommentCount = postSQLMapper.selectCountPostComment(post_no);
		FollowVo followVo = customerSQLMapper.selectFollowByFollowerAndFollowee(customer_no, postVo.getCustomer_no());
		for(SubpostVo subPostVo : subPostList) {
		ArrayList<HashMap<String, Object>> subPostHashtagDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> subPostProductDataList = new ArrayList<HashMap<String,Object>>();
		int subpost_no	= subPostVo.getSubpost_no();
		String spaceTypeNmae = postSQLMapper.selectSpaceTypeNameBySubpostNo(subpost_no);
		ArrayList<SubpostHashtagVo> SubpostHashtagVos = postSQLMapper.selectSubPostHashtagBySubpostNo(subpost_no);
			if(SubpostHashtagVos.size() != 0) {
			for(SubpostHashtagVo subpostHashtagVo : SubpostHashtagVos) {
				int hashtag_no = subpostHashtagVo.getHashtag_no();
				HashtagVo hashtagVo = postSQLMapper.selectSubPostHashtagNameByhashtagNo(hashtag_no);
				HashMap<String, Object> hashtagMap = new HashMap<String, Object>();
				hashtagMap.put("subpostHashtagVo", subpostHashtagVo);
				hashtagMap.put("hashtagVo", hashtagVo);
				subPostHashtagDataList.add(hashtagMap);
			}
			}
		ArrayList<SubpostProductVo>	subPostProductList = postSQLMapper.selectSubPostProductBySubPostNo(subpost_no);
			if(subPostProductList.size() != 0 ) {
			for(SubpostProductVo subPostProductVo:subPostProductList) {
				int product_no = subPostProductVo.getProduct_no();
				ArrayList<ProductTitleImageVo> productTitleImageList= postSQLMapper.selectProductTitleImageLinkByProductNo(product_no);
				ProductTitleImageVo image = productTitleImageList.get(0);
				String ProductImage = image.getTitle_image_link();
				ProductVo productVo = postSQLMapper.selectProductByProductNo(product_no);
				int vender_no = productVo.getVendor_no();
				HashMap<String, Object> productMap = new HashMap<String, Object>();
				String ProductBrandName = postSQLMapper.selectVendorBrandNameByVendorNo(vender_no);
				productMap.put("ProductImage", ProductImage);
				productMap.put("productVo", productVo);
				productMap.put("ProductBrandName", ProductBrandName);
				productMap.put("subPostProductVo", subPostProductVo);
				subPostProductDataList.add(productMap);
			}
			}
		HashMap<String, Object> subMap= new HashMap<String, Object>();
		subMap.put("subPostProductDataList", subPostProductDataList);
		subMap.put("subPostHashtagDataList",subPostHashtagDataList);
		subMap.put("spaceTypeNmae", spaceTypeNmae);
		subMap.put("subPostVo", subPostVo);
		
		subPostDataList.add(subMap);
		}
		for(PostVo custmoerPostVo : customerPostList) {
				ArrayList<SubpostVo> subPostVos = postSQLMapper.selectSubPostByPostNo(custmoerPostVo.getPost_no());
				SubpostVo customerSubPostVo = subPostVos.get(0);
				HashMap<String, Object> customerSubPostMap = new HashMap<String, Object>();
				
				customerSubPostMap.put("customerSubPostVo", customerSubPostVo);
				customerSubPostDataList.add(customerSubPostMap);
			}

		for(PostCommentVo postCommentVo : postCommentList) {
			int commentCustomerNo = postCommentVo.getCustomer_no();
			int post_comment_no = postCommentVo.getPost_comment_no();
			CustomerVo commentCustomerVo = customerSQLMapper.selectCustomerByCustomerNo(commentCustomerNo);
			PostCommentLikeVo postCommentLikeVo = postSQLMapper.selectPostLikeByCustomerNoAndPostCommentNo(customer_no, post_comment_no);
			
//			ArrayList<NestedCommentVo> nestedCommentList = postSQLMapper.selectNestedCommentByPostCommentNo(post_comment_no);
//			
//			for(NestedCommentVo nestedCommentVo: nestedCommentList) {
//				
//				
//				
//				HashMap<String, Object> nestedCommentmap = new HashMap<String, Object>();
//				
//				
//			}
			HashMap<String, Object> commentMap = new HashMap<String, Object>();
			
			
			
			commentMap.put("postCommentLikeVo", postCommentLikeVo);
			commentMap.put("commentCustomerVo", commentCustomerVo);
			commentMap.put("postCommentVo", postCommentVo);
			
			postCommentDataList.add(commentMap);
		}
		
		
		
		int size = customerSubPostDataList.size();
		
		map.put("size",size);
		map.put("followVo", followVo);
		map.put("postCommentDataList", postCommentDataList);
		map.put("customerSubPostDataList", customerSubPostDataList);
		map.put("postCommentCount",postCommentCount);
		map.put("subPostDataList", subPostDataList);
		map.put("postCustomerVo", postCustomerVo);
		map.put("postVo", postVo);
		map.put("houseTypeName", houseTypeName);
		map.put("houseStyleName", houseStyleName);
		return map;
	}
	
	//포스트 좋아요 
	public void LikePost(PostLikeVo postLikeVo) {
		PostLikeVo postLike = postSQLMapper.selectPostLikeByPostNoAndCustomerNo(postLikeVo);
		if(null == postLike) {
			postSQLMapper.insertPostLike(postLikeVo);
			
		}else {
			postSQLMapper.deletePostLikeByCustomerNoAndPostNo(postLikeVo);
			
		}
	}
	
	//포스트댓글 좋아요
	public void LikePostComment(int customer_no, int post_comment_no) {
		PostCommentLikeVo postCommentLikeVo = postSQLMapper.selectPostLikeByCustomerNoAndPostCommentNo(customer_no, post_comment_no);
		if(null==postCommentLikeVo) {
			postSQLMapper.insertPostCommentLike(customer_no, post_comment_no);
		}else {
			postSQLMapper.deletePostCommentLikeByCustomerNoAndPostCommentNo(customer_no, post_comment_no);
		}
	}
	
	//포스트 스크랩
	public PostScrapVo ScrapPost(PostScrapVo postScrapVo) {
		PostScrapVo postScrap = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrapVo);
		if(null == postScrap) {
			postSQLMapper.insertPostScrap(postScrapVo);
			PostScrapVo result = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrapVo);
			return result;
		}else {
			postSQLMapper.deletePostScrapByCustomerNoAndPostNo(postScrapVo);	
			PostScrapVo result = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrapVo);
			return result;
		
		}
		
	}
	
	//포스트 댓글 등록
	public void RegisterPostComment(PostCommentVo post_CommentVo) {
		postSQLMapper.insertPostComment(post_CommentVo);
	}

	//포스트 PK생성
	public int PostPk() {
		
		return postSQLMapper.createPostPk();
	}
	
	//서브포스트를 위한 포스트PK불러오기
	public int PostPkForSubPost(int customer_no) {
		
		return postSQLMapper.selectLatestPostNoByCustomerNo(customer_no);
	}
	
	//해쉬태그 존재확인
	public boolean hasHashTag(String hashtag_keyword) {
		if(null == postSQLMapper.selectHashtagByHashtagKeyword(hashtag_keyword)) {
			return false;
		}else {
			return true;
		}
	}

	//해쉬태그 등록
	public void RegisterHashtag(String hashtag_keyword) {
		postSQLMapper.insertHashtag(hashtag_keyword);
	}

	//서브포스트 해쉬태그 등록
	public void RegisterSubPostHashtag(int subpost_no,int hashtag_no) {
		postSQLMapper.insertSubPostHashtag(subpost_no, hashtag_no);
	}
	
	//해쉬태그를 위한 서브포스트 넘버
	public int subpostNoForHashtag(int post_no) {
		
		return postSQLMapper.selectLatestSubPostNoByPostNo(post_no);
	}
	
	//해쉬태그 이름에 따른 해쉬태그 번호
	public int hashtagNo(String hashtag_keyword) {
		
		return postSQLMapper.selectHashtagNoByHashtagKeyword(hashtag_keyword);
	} 
	//포스트 삭제하기
	public void DeletePost(int post_no) {
		ArrayList<SubpostVo> subPostList= postSQLMapper.selectSubPostByPostNo(post_no);
		for(SubpostVo subPostVo : subPostList) {
			int subPost_no = subPostVo.getSubpost_no();
			postSQLMapper.deleteSubPostHashtagBySubPostNo(subPost_no);
		}
		ArrayList<PostCommentVo> postCommentList = postSQLMapper.selectPostCommentListByPostNo(post_no);
		for(PostCommentVo postCommentVo: postCommentList) {
			int postCommentNo= postCommentVo.getPost_comment_no();
			postSQLMapper.deleteNestedCommentByPostCommentNo(postCommentNo);
		}
		postSQLMapper.deleteSubpostByPostNo(post_no);
		postSQLMapper.deletePostCommentByPostNo(post_no);
		postSQLMapper.deletePostScrapByPostNo(post_no);
		postSQLMapper.deletePostLikeByPostNo(post_no);
		postSQLMapper.deletePostReportByPostNo(post_no);
		postSQLMapper.deletePostByPostNo(post_no);
	}
	
	
	public ArrayList<HashMap<String, Object>> getOrderedProductList(int customer_no, String searchWord){
		ArrayList<HashMap<String, Object>> orderedProductDataList = new ArrayList<HashMap<String,Object>>();
	
		ArrayList<ProductVo> orderedProductList = postSQLMapper.selectOrderedProductByCustomerNoAndsearcWord(customer_no, searchWord);
		
		for(ProductVo productVo: orderedProductList) {
			int vendor_no = productVo.getVendor_no();
			int product_no = productVo.getProduct_no();
			String vendorBrandName = postSQLMapper.selectVendorBrandNameByVendorNo(vendor_no);
			ArrayList<ProductTitleImageVo> productTitleImageList= postSQLMapper.selectProductTitleImageLinkByProductNo(product_no);
			ProductTitleImageVo image = productTitleImageList.get(0);
			String productTitleImage = image.getTitle_image_link();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("vendorBrandName", vendorBrandName);
			map.put("productVo", productVo);
			map.put("productTitleImage", productTitleImage);
			
			orderedProductDataList.add(map);
		}
	
		return orderedProductDataList;
	}
	
	public HashMap<String, Object> getProductDetail(int product_no){
		HashMap<String, Object> PrdouctDetailData = new HashMap<String, Object>();
		
		ProductVo productVo = postSQLMapper.selectProductByProductNo(product_no);
		ArrayList<ProductTitleImageVo> productTitleImageList= postSQLMapper.selectProductTitleImageLinkByProductNo(product_no);
		ProductTitleImageVo image = productTitleImageList.get(0);
		String productTitleImage = image.getTitle_image_link();
		String productBrandName = postSQLMapper.selectVendorBrandNameByVendorNo(productVo.getVendor_no());
		
		PrdouctDetailData.put("productBrandName", productBrandName);
		PrdouctDetailData.put("productTitleImage", productTitleImage);
		PrdouctDetailData.put("productVo", productVo);
		return PrdouctDetailData;
	}
	
	public void registerSubPostProduct(int subpost_no, int product_no) {
		postSQLMapper.insertSubPostProduct(subpost_no, product_no);
	}
	
	public void increasePostViews(int post_no) {
		postSQLMapper.updatePostViewsSByPostNo(post_no);
	}
	
	public void registerNestedComment(NestedCommentVo nestedCommentVo) {
		postSQLMapper.insertNestedComment(nestedCommentVo);
	}
	
	public void registerNestedCommentLike(NestedCommentLikeVo nestedCommentLikeVo) {
		postSQLMapper.insertNestedCommentLike(nestedCommentLikeVo);
	}

	public void deletePostComment(int post_comment_no) {
		postSQLMapper.deletePostCommentByPostCommentNo(post_comment_no);
	}
	
	public PostReportVo PostReport(PostReportVo postReportVo) {
		
		if(postSQLMapper.selectPostReportByCustomerNoAndPostNo(postReportVo) == null) {
			postSQLMapper.insertPostReport(postReportVo);
		}else {
			postSQLMapper.deletePostReportByCustomerNoAndPostNo(postReportVo);
		}
		
		return postSQLMapper.selectPostReportByCustomerNoAndPostNo(postReportVo);
		
	}
	
	
	 //포스트 좋아요 여부 확인
	   public boolean checkPostLike(PostLikeVo postLikeVo) {
		   if(postSQLMapper.selectPostLikeByPostNoAndCustomerNo(postLikeVo) != null) {
				return true;
			}else {
				return false;
			}
		}
	 
	 //포스트 좋아요 수 불러오기
	   public int selectCountPostLike(int post_no) {
		  return postSQLMapper.selectCountPostLike(post_no);
	   }
	   
	  //포스트 스크랩수 
	   public int CountPostScrap(int post_no) {
		   return postSQLMapper.selectCountPostScrap(post_no);
	   }
	   
	   public PostScrapVo checkPostScrap(PostScrapVo postScrapVo) {
		   return postSQLMapper.selectPostScrapByPostNoAndCustomerNo(postScrapVo);
	   }
	   
	   public int CountPostComment(int post_no) {
		   return postSQLMapper.selectCountPostComment(post_no);
	   }
	   
	   
	   public ArrayList<HashMap<String, Object>> getFollowPostList(int customer_no){
			ArrayList<HashMap<String, Object>> FollowPostDataList = new ArrayList<HashMap<String,Object>>();
			ArrayList<PostVo> PostList = postSQLMapper.selectMyFollowingPost(customer_no);
			for(PostVo postVo : PostList) {
				int post_no = postVo.getPost_no();
				int followee_no = postVo.getCustomer_no();
				ArrayList<SubpostVo> subPostList = postSQLMapper.selectSubPostByPostNo(post_no);
				SubpostVo subPostVo = subPostList.get(0);
				PostScrapVo postScrapVo = postSQLMapper.selectPostScrapByPostNoAndCustomerNo(post_no, customer_no);
				CustomerVo customerVo = customerSQLMapper.selectCustomerByCustomerNo(followee_no);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("customerVo", customerVo);
				map.put("postVo", postVo);
				map.put("subPostVo", subPostVo);
				map.put("postScrapVo", postScrapVo);
				FollowPostDataList.add(map);
			}
			
			return FollowPostDataList;
		}	
}
