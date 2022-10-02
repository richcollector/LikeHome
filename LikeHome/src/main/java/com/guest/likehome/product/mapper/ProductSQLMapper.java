package com.guest.likehome.product.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.ProductCategory1Vo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductScrapVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.SubpostVo;
import com.guest.likehome.vo.SubpostProductVo;

public interface ProductSQLMapper {

	//product
	public ProductVo selectProductByProductNo(int productNo);
	public ArrayList<ProductVo> selectProductAll();
	public int selectProductCountByProductCategory2No(int productCategory2No);
	
	public int[] selectProductNoAllByProductCategory2No(
			@Param("productCategory2No") int productCategory2No, 
			@Param("orderBy") int orderBy,
			@Param("pageNum") int pageNum
			);

	public int[] selectProductNoAllByproductCategory1No(int productCategory1No);
	public ArrayList<HashMap<String, Object>> selectProductByVendorNo(int vendorNo);
	public ArrayList<HashMap<String, Object>> selectProductByOrderDate();
	public ArrayList<HashMap<String, Object>> selectProductByProductName();
	
	
	
	//category
	public ProductCategory1Vo selectProductCategory1ByNo(int category1No);
	public ArrayList<ProductCategory1Vo> selectProductCategory1All();
	public ArrayList<ProductCategory2Vo> selectProductCategory2By1No(int category1No);
	public HashMap<String, Object> selectCategoryNameByProductNo(int productNo);
	public HashMap<String, Object> selectCategoryNameByProductCategory2No(int productCategory2No);
	
	
	
	
	//product scrap
	public void insertProductScrap(ProductScrapVo productScrapVo);
	public ProductScrapVo selectProductScrapByCustomerNoAndProductNo(ProductScrapVo productScrapVo);
	public void deleteProductScrapByCustomerNoAndProductNo(ProductScrapVo productScrapVo);
	public ArrayList<ProductScrapVo> selectProductScrapByCustomerNo(int customerNo);
	public ArrayList<HashMap<String, Object>> selectProductByProductScrapCount();
	
	//post
	public ArrayList<SubpostVo> selectSubpostByProductNo(int productNo);
	
	
	//test
	public int[] selectProductTest(
			@Param("productCategory2No") int productCategory2No,
			@Param("pageNum") int pageNum,
			@Param("orderBy") int orderBy
			);
	
	public int[] selectProductNoByOrderCount(int pageNum);
	public int selectCountProductScrapByCustomerNo(int customer_no);

}
