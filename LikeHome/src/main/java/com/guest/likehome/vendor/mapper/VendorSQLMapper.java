package com.guest.likehome.vendor.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.CartVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductCategory1Vo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductDetailImageVo;
import com.guest.likehome.vo.ProductScrapVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorMailAuthVo;
import com.guest.likehome.vo.VendorVo;

public interface VendorSQLMapper {

	//사업자회원가입
	public void insertVendor(VendorVo vendorVo);
	
	//사업자번호와 비밀번호로 사업자 정보가지고오기
	public VendorVo selectByBusinessAndPw(VendorVo vendorVo);
	
	//상품등록
	public void insertProduct(ProductVo ProductVo);
	
	//상품번호 키(공용)
	public int createProductPk();
	
	//타이틀이미지 데이터 저장
	public void insertTitleImage(ProductTitleImageVo productTitleImageVo);
	
	//디테일이미지 데이터 저장
	public void insertDetailImage(ProductDetailImageVo productDetailImageVo);
	
	//selectVendorProduct >> selectVendorProductByVendorNo
	//판매자 상품리스트 출력(검색)
	public ArrayList<ProductVo> selectVendorProductByVendorNo
	(@Param("vendor_no") int vendor_no,
	@Param("searchType") String searchType, 
	@Param("searchWord") String searchWord,
	@Param("pageNum") int pageNum
	);
	
	//selectCount >> selectProductCountByVendorNo
	//상품리스트 페이징
	public int selectProductCountByVendorNo
			(@Param("vendor_no") int vendor_no,
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord
			);
	
	//상품오더리스트 페이징
	public int selectOrderCount(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord
			);
	
	//selectByProduct(2개가 있어서 1개는 삭제) >> selectByProductNo (productNo 통일)
	//판매자 상품 출력
	public ProductVo selectByProductNo(int productNo);
	
	//상품 타이틀이미지 출력
	public ArrayList<ProductTitleImageVo> selectByTitleImage(int no);
	
	//상품 디테일이미지 출력
	public ArrayList<ProductDetailImageVo> selectByDetailImage(int no);
	
	//deleteProduct >> deleteProductByProductNo
	//판매자 상품리스트 삭제
	public void deleteProductByProductNo(int product_no);
	
	//판매자 상품리스트 수정
	public void updateProduct(ProductVo productVo);
	
	//변수명 수정 No >> vendorNo
	//selectByNo >> selectVendorByVendorNo
	//판매자 브랜드를 출력하기 위해
	public VendorVo selectVendorByVendorNo(int vendorNo);
	
	//상품등록 카테고리리스트1 출력
	public ArrayList<ProductCategory1Vo> selectProductCategory();
	
	//상품등록 카테고리리스트2 출력
	public ArrayList<ProductCategory2Vo> selectProductCategory2();
	
	// selectProductCategory12 >> selectProductCategoryNo1ByProductCategoryNo2
	//상품등록 카테고리1을 받아 카테고리2가 뜨도록
	public ArrayList<ProductCategory2Vo> selectProductCategoryNo1ByProductCategoryNo2(int product_category1_no);
	
	//상품 디테일 리스트
	public ArrayList<OrderDetailVo> selectOrderDetailAll(int orderNo);
	
	//판매자 상품 디테일 리스트
	public ArrayList<OrderDetailVo> selectOrderDetail(int productNo);
	
	//getCustomer >> getCustomerByCustomerNo
	//판매자 상품 고객
	public CustomerVo getCustomerByCustomerNo(int customerNo);
	
	//selectOrderByorderNo >> selectOrder
	//오더 리스트
	public ArrayList<OrderVo> selectOrder(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum);
	
	//selectOrderDetailByorderNo >> selectOrderDetailByOrderNo
	//오더 디테일 리스트
	public ArrayList<OrderVo> selectOrderDetailByOrderNo(int order_no);
	
	//selectOrderByorderNo2 >> selectOrderByorderNo
	//판매자 오더리스트
	public ArrayList<OrderVo> selectOrderByorderNo(int orderNo);
	
	//판매자 상품등록 상품명 중복확인
	public int selectProductCountByName(String product_name);
	
	public void updateDelivery
		(@Param("delivery_statusageNum") int delivery_statusageNum,
		@Param("ORDER_DETAIL_NO") int ORDER_DETAIL_NO);
	
	public OrderDetailVo getDeliveryStatusNo(int detailNo);
	
	public ArrayList<OrderDetailVo> allOrderDetail(@Param("searchType") String searchType, 
													@Param("searchWord") String searchWord);
	
	public int countProduct(int productNo);
	
	public ArrayList<ProductScrapVo> allProductScrap(@Param("searchTypeScrap") String searchTypeScrap, 
														@Param("searchWordScrap") String searchWordScrap);
	
	public int countScrapProduct(int productNo);
	
	public void updateVendor(VendorVo vendorVo);
	
	public int countSelectVendorId(String vendor_business_number);
	
	public int countSelectVendorPw(@Param("vendor_business_number") String vendor_business_number,
									@Param("vendor_pw") String vendor_pw);
	
	public String SelectVendorState(@Param("vendor_business_number") String vendor_business_number,
									@Param("vendor_pw") String vendor_pw);

	public void deleteProductByProductNoCart(int product_no);
	public void deleteProductByProductNoOrderDetail(int product_no);
	public void deleteProductByProductNoTitleImage(int product_no);
	public void deleteProductByProductNoDetailImage(int product_no);
	public void deleteProductByProductNoScrap(int product_no);
	public void deleteOrderByOrderNo(int order_no);
	
	public ArrayList<Integer> selectOrderDetailNoByProductNo(int product_no);
	public ArrayList<OrderVo> selectOrderByOrder(int order_no);
	public ArrayList<CartVo> selectCartByOrderNo(int product_no);
	public ArrayList<ProductScrapVo> selectScrapByProductNo(int product_no);
	
	public int selectVendorCountByBrand(String brand_name);
	
	public void updateReVendor(VendorVo vendorVo);
	
	//메일 인증 
	public void insertVendorMailAuth(VendorMailAuthVo vendorMailAuthVo);
	public void updateCompleteY(String auth_Key);
	
	//상품번호 키(공용)
	public int createVendorPk();
	public VendorMailAuthVo selectByAuth(@Param("vendor_business_number") String vendor_business_number,
										@Param("vendor_pw") String vendor_pw);
	
}
