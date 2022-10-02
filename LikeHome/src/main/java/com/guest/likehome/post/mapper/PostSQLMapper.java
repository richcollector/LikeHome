package com.guest.likehome.post.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.HashtagVo;
import com.guest.likehome.vo.HouseStyleVo;
import com.guest.likehome.vo.HouseTypeVo;
import com.guest.likehome.vo.NestedCommentLikeVo;
import com.guest.likehome.vo.NestedCommentVo;
import com.guest.likehome.vo.PostCommentLikeVo;
import com.guest.likehome.vo.PostCommentVo;
import com.guest.likehome.vo.PostLikeVo;
import com.guest.likehome.vo.PostReportVo;
import com.guest.likehome.vo.PostScrapVo;
import com.guest.likehome.vo.PostVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.SpaceTypeVo;
import com.guest.likehome.vo.SubpostProductVo;
import com.guest.likehome.vo.SubpostVo;
import com.guest.likehome.vo.SubpostHashtagVo;

public interface PostSQLMapper {
	
	//포스트등록
	public void insertPost(PostVo postVo);
	
	//서브포스트등록
	public void inserSubPost(SubpostVo subPost);
	
	//하우스스타일 불러오기
	public ArrayList<HouseStyleVo> selectHouseStyleAll();
	
	//하우스타입 불러오기
	public ArrayList<HouseTypeVo> selectHouseTypeAll();
	
	//공간타입불러오기
	public ArrayList<SpaceTypeVo> selectSpaceTypeAll();
	
	//포스트리스트 불러오기
	public ArrayList<PostVo> selectPostAll(
			@Param("house_type_no") int house_type_no,
			@Param("house_style_no") int house_style_no,
			@Param("space_type_no") int space_type_no,
			@Param("orderby") String orderby
			);

	//포스트에 달린 서브포스트리스트 불러오기
	public ArrayList<SubpostVo> selectSubPostByPostNo(int post_no);
	
	//포스트에 달린 댓글리스트 불러오기s
	public ArrayList<PostCommentVo> selectPostCommentListByPostNo(int post_no);

	//포스트 좋아요 등록
	public void insertPostLike(PostLikeVo postLikeVo);

	//포스트 좋아요 삭제
	public void deletePostLikeByCustomerNoAndPostNo(PostLikeVo postLikeVo);

	//로그인한 사람이 해당포스트에 좋아요했는지 확인
	public PostLikeVo selectPostLikeByPostNoAndCustomerNo(
			@Param("customer_no")int customer_no,
			@Param("post_no")int post_no
			);

	//포스트 스크랩 등록
	public void insertPostScrap(PostScrapVo postScrapVo);
	
	//포스트 스크랩 삭제
	public void deletePostScrapByCustomerNoAndPostNo(PostScrapVo postScrapVo);
	
	//로그인한 사람이 해당포스트를 스크랩했는지 확인
	public PostScrapVo selectPostScrapByPostNoAndCustomerNo(PostScrapVo postScrapVo);
	
	//포스트의 좋아요 수 불러오기
	public int selectCountPostLike(int post_no);
	
	//포스트의 댓글 수 불러오기
	public int selectCountPostComment(int post_no);
	
	//포스트의 스크랩수 불러오기
	public int selectCountPostScrap(int post_no);

	//포스트 올린사람의 정보 불러오기
	public CustomerVo selectCustomerVoByPostNo(int post_no);
	
	//포스트 넘버로 포스트정보 불러오기
	public PostVo selectPostByPostNo(int post_no);
	
	//포스트 넘버로 하우스타입이름 불러오기
	public String selectHouseTypeNameByPostNo(int post_no);
	
	//포스트넘버로 하우스스타일이름 불러오기
	public String selectHouseStyleNameByPostNo(int post_no);
	
	//서브포스트넘버로 스페이스타입이름 불러오기
	public String selectSpaceTypeNameBySubpostNo(int subpost_no);

	//서브포스트의 해쉬태그 가지고오기
	public ArrayList<SubpostHashtagVo> selectSubPostHashtagBySubpostNo(int subpost_no);
	
	//해쉬태그 번호로 해쉬태그 이름 가지고오기
	public HashtagVo selectSubPostHashtagNameByhashtagNo(int hashtag_no);
	
	//포스트 회원넘버로 포스트 리스트 불러오기
	public ArrayList<PostVo> selectPostListByPostCustomerNo(int PostCustomer_no);

	//포스트 댓글 등록
	public void insertPostComment(PostCommentVo post_CommentVo);

	//포스트 댓글 좋아요 확인
	public PostCommentLikeVo selectPostLikeByCustomerNoAndPostCommentNo(
			@Param("customer_no") int customer_no,
			@Param("post_comment_no") int post_comment_no
			);
	
	//포스트 댓글 좋아요 등록
	public void insertPostCommentLike(
			@Param("customer_no") int customer_no,
			@Param("post_comment_no") int post_comment_no

			);
	//포스트 댓글 좋아요 해제
	public void deletePostCommentLikeByCustomerNoAndPostCommentNo(
			@Param("customer_no") int customer_no,
			@Param("post_comment_no") int post_comment_no
			);
	
	//포스트 PK생성
	public int createPostPk();
	
	//회원의 최신 포스트 넘버 불러오기
	public int selectLatestPostNoByCustomerNo(int customer_no);
	
	//해쉬태그 키워드로 해쉬태그 정보 불러오기
	public HashtagVo selectHashtagByHashtagKeyword(String hashtag_keyword);
	
	//해쉬태그 등록
	public void insertHashtag(String hashtag_keyword);
	
	//서브포스트 해쉬태그 등록
	public void insertSubPostHashtag(
			@Param("subpost_no") int subpost_no,
			@Param("hashtag_no") int hashtag_no
			);
	
	public int selectLatestSubPostNoByPostNo(int post_no);
	
	public int selectHashtagNoByHashtagKeyword(String hashtag_keyword);
	
	public void deletePostByPostNo(int post_no);
	
	public void deleteSubpostByPostNo(int post_no);
	
	public void deleteSubPostHashtagBySubPostNo(int subpost_no);
	
	public void deletePostCommentByPostNo(int post_no);
	
	public void deletePostScrapByPostNo(int post_no);
	
	public void deletePostLikeByPostNo(int post_no);
	
	public void deletePostReportByPostNo(int post_no);
	
	public void insertPostReport(PostReportVo postReportVo);
	
	public void deletePostReportByCustomerNoAndPostNo(PostReportVo postReportVo);
	
	public PostReportVo selectPostReportByCustomerNoAndPostNo(PostReportVo postReportVo);
	
	public ArrayList<ProductVo> selectOrderedProductByCustomerNoAndsearcWord(
			@Param("customer_no") int customer_no,
			@Param("searchWord") String searchWord
			);
	
	public String selectVendorBrandNameByVendorNo(int vendor_no);
	
	public ArrayList<ProductTitleImageVo> selectProductTitleImageLinkByProductNo(int prodcut_no);
	
	public ProductVo selectProductByProductNo(int product_no);
	
	public void insertSubPostProduct(
			@Param("subpost_no") int subpost_no,
			@Param("product_no") int product_no
			);
	
	public ArrayList<SubpostProductVo> selectSubPostProductBySubPostNo(int subpost_no);
	
	public void updatePostViewsSByPostNo(int post_no);
	
	public void insertNestedComment(NestedCommentVo nestedCommentVo);
	
	public void insertNestedCommentLike(NestedCommentLikeVo nestedCommentLikeVo);
	
	public ArrayList<NestedCommentVo> selectNestedCommentByPostCommentNo(int post_comment_no);
	
	public void deletePostCommentByPostCommentNo(int post_comment_no);
	
	public void deleteNestedCommentByPostCommentNo(int post_comment_no);

	public PostLikeVo selectPostLikeByPostNoAndCustomerNo(PostLikeVo postLikeVo);

	//스타일링샷
	public ArrayList<SubpostVo> selectSubpostByProductNo(int productNo);
	
	
	//포스트 카운트
	public int selectCountPostByCustomerNo(int customer_no);
	
	//좋아요 포스트 불러오기
	public ArrayList<PostVo> selectPostAllForFollowListPage();
	
	//내가 팔로우 한 사람의 post_no 가져오기
	public ArrayList<PostVo> selectMyFollowingPost(int customer_no);

	//로그인한 사람이 해당포스트를 스크랩했는지 확인
	public PostScrapVo selectPostScrapByPostNoAndCustomerNo(
			@Param("post_no")int post_no,
			@Param("customer_no")int customer_no
			);

	//추가
   public ArrayList<PostScrapVo> selectPostScrapByCustomerNo(int customer_no);
   //추가
   public ArrayList<PostLikeVo> selectPostLikeBycustomerNo(int customer_no);
   //추가
   public int selectCountPostScrapByCustomerNo(int customer_no);
   //추가
   public int selectCountPostLikeByCustomerNo(int customer_no);
   //추가
   public ArrayList<PostVo> selectPostByPostLikeCount();
	
	

}
