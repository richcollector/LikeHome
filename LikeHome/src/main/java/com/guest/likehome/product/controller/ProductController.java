package com.guest.likehome.product.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guest.likehome.product.service.ProductServiceImpl;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private ProductServiceImpl productService;
	
	
	@RequestMapping("productDetailPage")
	public String productDetailPage(int product_no, Model model) {
		
		model.addAttribute("productData", productService.getProductDetail(product_no));
		model.addAttribute("subpostDataList", productService.getSubpostList(product_no));
		model.addAttribute("categoryLayer", productService.getProductCategoryLayerForDetail(product_no));
		
		return "product/productDetailPage";
	}
	
	
	@RequestMapping("productCategoryPage")
	public String productCategoryPage(Model model) {
		
		model.addAttribute("productCategory1List", productService.getProductCategory1List());
		
		return "product/productCategoryPage";
	}
	
	
	
	//필터 조건 들어간 리스트
	@RequestMapping("productListPage")
	public String productListPage(Model model, 
			@RequestParam(value= "productCategory2No", defaultValue = "0") int productCategory2No,//best에도 쓰려고 해둠
			@RequestParam(value= "orderBy", defaultValue = "0") int orderBy,//기본판매순(0)
			@RequestParam(value= "pageNum", defaultValue = "1") int pageNum //기본 첫페이지(1)
			) {
		
//		System.out.println("pageNum : " + pageNum);
//		System.out.println("productCategory2No : " + productCategory2No);
//		System.out.println("orderBy : " + orderBy);
//		String aa = RandomStringUtils.randomNumeric(4);
//		System.out.println(aa);
//		
		model.addAttribute("productDataList", productService.getProductList(productCategory2No, orderBy, pageNum));
		model.addAttribute("productCategory1List", productService.getProductCategory1List());
		model.addAttribute("currentCategory2No", productCategory2No);
		model.addAttribute("categoryLayer", productService.getProductCategoryLayerForList(productCategory2No));
//		
//		System.out.println(model);
		
		return "product/productListPage";
	}
	
	@RequestMapping("bestProductPage")
	public String bestProductPage() {
		return "product/bestProductPage";
	}
	
	@RequestMapping("productPostListPage")
	public String productPostListPage(int product_no, Model model) {
		
		model.addAttribute("productData", productService.getProductDetail(product_no));
		model.addAttribute("subpostDataList", productService.getSubpostList(product_no));
		
		return "product/productPostListPage";
	}
	
	@RequestMapping("brandProductPage")
	public String brandProductPage(int vendorNo, Model model) {
		
		model.addAttribute("productDataList", productService.getBrandProductList(vendorNo));
		
		return "product/brandProductPage";
	}
}
