
package com.guest.likehome.product.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.post.mapper.PostSQLMapper;
import com.guest.likehome.product.mapper.ProductSQLMapper;
import com.guest.likehome.vendor.mapper.VendorSQLMapper;
import com.guest.likehome.vo.ProductCategory1Vo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductDetailImageVo;
import com.guest.likehome.vo.ProductScrapVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.SubpostVo;
import com.guest.likehome.vo.VendorVo;

@Service
public class ProductServiceImpl {

	@Autowired
	private ProductSQLMapper productSQLMapper;
	@Autowired
	private VendorSQLMapper vendorSQLMapper;
	@Autowired
	private PostSQLMapper postSQLMapper;
	
	public ProductVo getProduct(int productNo) {
		return productSQLMapper.selectProductByProductNo(productNo);
	}
	
	public HashMap<String, Object> getProductTotalInfo(int productNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ProductVo productVo = productSQLMapper.selectProductByProductNo(productNo);
		
		map.put("productVo", productVo);
		map.put("vendorVo", vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no()));
		map.put("productTitleImageVo", vendorSQLMapper.selectByTitleImage(productNo).get(0));
		
		return map;
	}
	
	public HashMap<String, Object> getProductDetail(int productNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> productTitleImageList = new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> productDetailImageList = new ArrayList<HashMap<String,Object>>();
		
		ProductVo productVo = productSQLMapper.selectProductByProductNo(productNo);
		VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
		
		
		ArrayList<ProductTitleImageVo> productTitleImageVoList = vendorSQLMapper.selectByTitleImage(productNo); 
		for(ProductTitleImageVo productTitleImageVo : productTitleImageVoList) {
			HashMap<String, Object> titlemap = new HashMap<String, Object>();
			titlemap.put("productTitleImageVo", productTitleImageVo);
			productTitleImageList.add(titlemap);
		}
		
		ArrayList<ProductDetailImageVo> productDetailImageVoList = vendorSQLMapper.selectByDetailImage(productNo);
		for(ProductDetailImageVo productDetailImageVo : productDetailImageVoList) {
			HashMap<String, Object> detailmap = new HashMap<String, Object>();
			detailmap.put("productDetailImageVo", productDetailImageVo);
			productDetailImageList.add(detailmap);
		}
		
		map.put("productVo", productVo);
		map.put("vendorVo", vendorVo);
		map.put("productTitleImageList", productTitleImageList);
		map.put("productDetailImageList", productDetailImageList);
		
		return map;  
	}
	
	public int getProductCount(int productCategory2No) {
		return productSQLMapper.selectProductCountByProductCategory2No(productCategory2No);
	}
	
	
	public ArrayList<HashMap<String, Object>> getProductListByCategory1(int productCategory1No){
	 
		ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String,Object>>();
		
		int[] productNoList = productSQLMapper.selectProductNoAllByproductCategory1No(productCategory1No);
		
		for(int no : productNoList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ProductVo productVo = productSQLMapper.selectProductByProductNo(no);
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
			ProductTitleImageVo productTitleImageVo = vendorSQLMapper.selectByTitleImage(productVo.getProduct_no()).get(0);
			
			map.put("vendorVo", vendorVo);
			map.put("productVo", productVo);
			map.put("productTitleImageVo", productTitleImageVo);
			
			productList.add(map);
		}
		return productList;
	}
	
	
	public ArrayList<HashMap<String, Object>> getProductList(int productCategory2No, int orderBy, int pageNum){
		
		ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String,Object>>();
		
		int[] productNoList = productSQLMapper.selectProductNoAllByProductCategory2No(productCategory2No, orderBy, pageNum);
		
		for(int no : productNoList) {
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ProductVo productVo = productSQLMapper.selectProductByProductNo(no);
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
			ProductTitleImageVo productTitleImageVo = vendorSQLMapper.selectByTitleImage(productVo.getProduct_no()).get(0);
			
			map.put("vendorVo", vendorVo);
			map.put("productVo", productVo);
			map.put("productTitleImageVo", productTitleImageVo);
			
			productList.add(map);
		}
		return productList;
	}
	
	
	public ArrayList<ProductCategory1Vo> getProductCategory1List(){

		return productSQLMapper.selectProductCategory1All();
	}
	
	
	public ArrayList<ProductCategory2Vo> getProductCategory2List(int category1No){
		
		return productSQLMapper.selectProductCategory2By1No(category1No);
	}
	
	
	public void scrapProduct(ProductScrapVo productScrapVo) {
		
		if(productSQLMapper.selectProductScrapByCustomerNoAndProductNo(productScrapVo) == null) {
			productSQLMapper.insertProductScrap(productScrapVo);
		}else {
			productSQLMapper.deleteProductScrapByCustomerNoAndProductNo(productScrapVo);
		}
	}
	
	public boolean checkProductScrap(ProductScrapVo productScrapVo) {
		return productSQLMapper.selectProductScrapByCustomerNoAndProductNo(productScrapVo) != null ? true : false;
	}

	public ArrayList<SubpostVo> getSubpostList(int productNo){
		return postSQLMapper.selectSubpostByProductNo(productNo);
	}
	
	public HashMap<String, Object> getProductCategoryLayerForDetail(int productNo){
		return productSQLMapper.selectCategoryNameByProductNo(productNo);
	}
		
	public HashMap<String, Object> getProductCategoryLayerForList(int productCategory2No){
		return productSQLMapper.selectCategoryNameByProductCategory2No(productCategory2No);
	}
	
	public ArrayList<HashMap<String, Object>> getBestScrappedProductList(){
		ArrayList<HashMap<String, Object>> dataList = productSQLMapper.selectProductByProductScrapCount();
		
		for(HashMap<String, Object> data : dataList) {
			int productNo = Integer.parseInt(String.valueOf(data.get("PRODUCT_NO")));
			data.put("TITLE_IMAGE_LINK", vendorSQLMapper.selectByTitleImage(productNo).get(0).getTitle_image_link());
		}
		return dataList;
	}
	
	public ArrayList<HashMap<String, Object>> getBrandProductList(int vendorNo){
		ArrayList<HashMap<String, Object>> dataList = productSQLMapper.selectProductByVendorNo(vendorNo);
		
		for(HashMap<String, Object> data : dataList) {
			int productNo = Integer.parseInt(String.valueOf(data.get("PRODUCT_NO")));
			data.put("TITLE_IMAGE_LINK", vendorSQLMapper.selectByTitleImage(productNo).get(0).getTitle_image_link());
		}
		return dataList;
	}
	
	public ArrayList<HashMap<String, Object>> getTodayBestProductList(){
		ArrayList<HashMap<String, Object>> dataList = productSQLMapper.selectProductByOrderDate();
		
		for(HashMap<String, Object> data : dataList) {
			int productNo = Integer.parseInt(String.valueOf(data.get("PRODUCT_NO")));
			data.put("TITLE_IMAGE_LINK", vendorSQLMapper.selectByTitleImage(productNo).get(0).getTitle_image_link());
		}
		return dataList;
	}
	
	public ArrayList<HashMap<String, Object>> getSearchedProduct(){
		ArrayList<HashMap<String, Object>> dataList = productSQLMapper.selectProductByProductName();
		
		for(HashMap<String, Object> data : dataList) {
			int productNo = Integer.parseInt(String.valueOf(data.get("PRODUCT_NO")));
			data.put("TITLE_IMAGE_LINK", vendorSQLMapper.selectByTitleImage(productNo).get(0).getTitle_image_link());
		}
		return dataList;
	}
	
}
