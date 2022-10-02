package com.guest.likehome.product.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.guest.likehome.product.service.ProductServiceImpl;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.ProductScrapVo;

@RestController
@RequestMapping("/product/*")
public class RestProductController {
	
	@Autowired
	private ProductServiceImpl productService;
	
	@RequestMapping("restShowProductCategory2ListProcess")
	public HashMap<String, Object> restShowProductCategory2List(int category1No){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("productCategory2List", productService.getProductCategory2List(category1No));
		
		return map;
		
	}
	
	@RequestMapping("restShowCategory1ProductProcess")
	public HashMap<String, Object> restShowCategory1ProductProcess(int category1No ){
		
		System.out.println(category1No);
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("productDataList", productService.getProductListByCategory1(category1No));
		
		return map;
	}
	
	//필터 조건 들어간 리스트
	@RequestMapping("restProductListPage")
	public HashMap<String, Object> restProductListPage( 
			@RequestParam(value= "productCategory2No", defaultValue = "0") int productCategory2No,
			@RequestParam(value= "orderBy", defaultValue = "0") int orderBy,
			@RequestParam(value= "pageNum", defaultValue = "1") int pageNum
			) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int productCount = productService.getProductCount(productCategory2No);
		int totalPageCount = (int)Math.ceil(productCount/6.0);

		System.out.println(totalPageCount);
		
		map.put("productDataList", productService.getProductList(productCategory2No, orderBy, pageNum));
		map.put("productCategory1List", productService.getProductCategory1List());
		map.put("productCount", productCount);
		map.put("totalPageCount", totalPageCount);
		
		
		return map;
	}
	
	@RequestMapping("restScrapProductProcess")
	public HashMap<String, Object> restScrapProductProcess(ProductScrapVo productScrapVo, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = customerVo.getCustomer_no();

		productScrapVo.setCustomer_no(customerNo);
		productService.scrapProduct(productScrapVo);
		
		return map;
	}
	
	@RequestMapping("restCheckProductScrapProcess")
	public HashMap<String, Object> restCheckProductScrapProcess(ProductScrapVo productScrapVo, HttpSession session){
		
		System.out.println(productScrapVo.getProduct_no());
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = customerVo.getCustomer_no();
		productScrapVo.setCustomer_no(customerNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", productService.checkProductScrap(productScrapVo));
		
		return map;
	}
	
	
	@RequestMapping("restBestScrappedProductPage")
	public HashMap<String, Object> restBestScrappedProductPage() {
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("productDataList", productService.getBestScrappedProductList());
		
		return map;
	}
	
	
	@RequestMapping("restProductPostListPage")
	public HashMap<String, Object> restProductPostListPage(int productNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("productData", productService.getProductDetail(productNo));
		map.put("subpostDataList", productService.getSubpostList(productNo));
		
		return map;
	}
	
	
	@RequestMapping("restBrandProductPage")
	public HashMap<String, Object> restBrandProductPage(int vendorNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("productDataList", productService.getBrandProductList(vendorNo));
		
		return map;
	}
}
