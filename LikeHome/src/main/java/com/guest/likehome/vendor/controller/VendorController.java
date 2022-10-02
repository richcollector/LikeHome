package com.guest.likehome.vendor.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.guest.likehome.vendor.mapper.VendorSQLMapper;
import com.guest.likehome.vendor.service.VendorServiceImpl;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductCategory1Vo;
import com.guest.likehome.vo.ProductDetailImageVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

@Controller
@RequestMapping("/vendor/*")
public class VendorController {

	@Autowired
	VendorServiceImpl vendorService;
	
	@Autowired
	VendorSQLMapper vendorSQLMapper;
	
	@RequestMapping("vendorLoginPage")
	public String vendorLoginPage() {
		
		return "vendor/vendorLoginPage";
	}
	
	//사업자회원 회원가입페이지 이동
	@RequestMapping("vendorRegisterPage")
	public String vendorRegisterPage() {
		
		return "vendor/vendorRegisterPage";
	}

	//서비스 vendorRegister >> registerVendor
	@RequestMapping("vendorRegisterProcess")
	public String vendorRegisterProcess(
			VendorVo vendorVo, HttpSession session,
			MultipartFile [] vendor_license) {

		//판매자no 동시생성
		int vendorPk = vendorSQLMapper.createVendorPk();
		
		for(MultipartFile file : vendor_license) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			//사업자등록증 폴더 생성
			String folderName = "/uploadFiles/vendorLicenseImage/";
			File licenseFolder = new File(folderName);
			if(!licenseFolder.exists()) {
				licenseFolder.mkdirs();
			}
			
			//사업자등록증 이름 생성
			String originalFileName = file.getOriginalFilename();
			vendorVo.setVendor_license_filename(originalFileName);
			
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			vendorVo.setVendor_license_link(randomName);
			
			try {
				file.transferTo(new File(folderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		vendorVo.setVendor_no(vendorPk);
		vendorService.registerVendor(vendorVo);
		
		VendorVo vendorInfo = vendorService.vendorLogin(vendorVo);
		session.setAttribute("vendorInfo", vendorInfo);
		String authority = "1";
		session.setAttribute("authority", authority);
		
		return "vendor/vendorLoginPage";
	}
	
	@RequestMapping("vendorLoginProcess")
	public String vendorLoginProcess(VendorVo vendorVo, HttpSession session) {

		VendorVo vendorInfo = vendorService.vendorLogin(vendorVo);
		session.setAttribute("vendorInfo", vendorInfo);
		String authority = "1";
		session.setAttribute("authority", authority);
		
		return "redirect:../vendor/vendorMainPage";
	}
	
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate(); //세션 객체 소멸.. 재생성..
		
		return "redirect:../main/mainPage";
	}
	
	@RequestMapping("updateVendor")
	public String updateVendor(VendorVo vendervo) {
		vendorService.updateVendor(vendervo);
		return "vendor/vendorMainPage";
	}
	
	//판매자 메인 페이지 이동
	@RequestMapping("vendorMainPage")
	public String vendorMainPage(Model model, HttpSession session, 
							String searchType, String searchWord,
							String searchTypeScrap, String searchWordScrap) {
		
		HashMap<Integer, Integer> productList = vendorService.allOrderDetail(session, searchType, searchWord);
		List<Entry<Integer, Integer>> list_entries = new ArrayList<Entry<Integer, Integer>>(productList.entrySet());
		
		Collections.sort(list_entries, new Comparator<Entry<Integer, Integer>>() {
			// compare로 값을 비교
			public int compare(Entry<Integer, Integer> obj1, Entry<Integer, Integer> obj2) {
				// 오름 차순 정렬
				return obj2.getValue().compareTo(obj1.getValue());
			}
		});
		
		ArrayList<HashMap<String, Object>> popularProduct = new ArrayList<HashMap<String,Object>>();
		int i = 0;
		for(Entry<Integer, Integer> entry : list_entries) {
			i += 1;
			HashMap<String, Object> map = new HashMap<String, Object>();
			int productNo = entry.getKey();
			map.put("no", i);
			map.put("productVo", vendorSQLMapper.selectByProductNo(productNo));
			map.put("productCount", vendorSQLMapper.countProduct(productNo));
			popularProduct.add(map);
		}
		
		model.addAttribute("popularProduct", popularProduct);
		
		//스크랩

		HashMap<Integer, Integer> productScrapList = vendorService.allProductScrap(session, searchTypeScrap, searchWordScrap);
		
		List<Entry<Integer, Integer>> scrapList_entries = new ArrayList<Entry<Integer, Integer>>(productScrapList.entrySet());
		
		Collections.sort(scrapList_entries, new Comparator<Entry<Integer, Integer>>() {
			// compare로 값을 비교
			public int compare(Entry<Integer, Integer> obj1, Entry<Integer, Integer> obj2) {
				// 오름 차순 정렬
				return obj2.getValue().compareTo(obj1.getValue());
			}
		});
		
		ArrayList<HashMap<String, Object>> popularScrap = new ArrayList<HashMap<String,Object>>();
		int j = 0;
		for(Entry<Integer, Integer> entry : scrapList_entries) {
			j += 1;
			HashMap<String, Object> map = new HashMap<String, Object>();
			int productNo = entry.getKey();
			map.put("no", j);
			map.put("productVo", vendorSQLMapper.selectByProductNo(productNo));
			map.put("countScrapProduct", vendorSQLMapper.countScrapProduct(productNo));
			popularScrap.add(map);
		}
		
		model.addAttribute("popularScrap", popularScrap);

		
		return "vendor/vendorMainPage";
	}
	
	//판매자 상품 등록 페이지
	@RequestMapping("vendorProductRegisterPage")
	public String vendorProductRegisterPage(Model model) {
		
		ArrayList<HashMap<String, Object>> categoryDataList = vendorService.getCategoryList1();
		ArrayList<HashMap<String, Object>> categoryDataList2 = vendorService.getCategoryList2();
		model.addAttribute("categoryDataList",categoryDataList);
		model.addAttribute("categoryDataList2",categoryDataList2);
		
		return "vendor/vendorProductRegisterPage";
	}
	
	
	//return값 변경 : vendorProductList >> vendorProductListPage
	//상품 등록 프로세스
	@RequestMapping("writeProductProcess")
	public String writeProductProcess
		(ProductTitleImageVo productTitleImageVo, 
		ProductDetailImageVo productDetailImageVo,
		ProductVo productVo, VendorVo vendorVo, 
		MultipartFile [] product_title_image, 
		MultipartFile [] product_detail_image, 
		HttpSession session ) {
		
		//프로덕트 no 동시 생성
		int productPk = vendorSQLMapper.createProductPk();
		
		//타이틀 사진 저장
		for(MultipartFile file : product_title_image) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			//타이틀이미지 폴더 생성
			String folderName = "/uploadFiles/titleImage/";
			File titleFolder = new File(folderName);
			if(!titleFolder.exists()) {
				titleFolder.mkdirs();
			}
			
			//타이틀이미지 이름 생성
			String originalFileName = file.getOriginalFilename();
			productTitleImageVo.setTitle_image_filename(originalFileName);
			
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			
			
			try {
				file.transferTo(new File(folderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			productTitleImageVo.setTitle_image_link(randomName);
			productTitleImageVo.setProduct_no(productPk);
			
			vendorService.writeTitleImage(productTitleImageVo);
			
		}
		
		//상세이미지 저장
		for(MultipartFile file : product_detail_image) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			//상세 이미지 폴더 생성
			String folderName = "/uploadFiles/detailImage/";
			File detailFolder = new File(folderName);
			if(!detailFolder.exists()) {
				detailFolder.mkdirs();
			}
			
			//타이틀이미지 이름 생성
			String originalFileName = file.getOriginalFilename();
			productDetailImageVo.setDetail_image_filename(originalFileName);
			
			String randomName = UUID.randomUUID().toString();
			randomName += "_" + System.currentTimeMillis();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			randomName += ext;
			
			try {
				file.transferTo(new File(folderName + randomName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			productDetailImageVo.setDetail_image_link(randomName);
			productDetailImageVo.setProduct_no(productPk);
			
			vendorService.writeDetailImage(productDetailImageVo);
		}
		productVo.setProduct_no(productPk);
		vendorService.writeProduct(productVo);
		
		return "redirect:./vendorProductListPage";
	}
	
	//return값 수정 : vendorProductList >> vendorProductListPage
	//서비스 deleteProductByProductNo
	//상품 삭제 프로세스
	@RequestMapping("deleteProductProcess")
	public String deleteProductProcess(int product_no) {
		vendorService.deleteProductByProductNo(product_no);
		
		

		return "redirect:./vendorProductListPage";
	}
	
//	return값 수정 : vendorProductList >> vendorProductListPage
//	상품 수정 프로세스
	@RequestMapping("updateProductProcess")
	public String updateProductProcess(ProductVo productVo) {
		vendorService.updateProduct(productVo);
		return "redirect:./vendorProductListPage";
	}
	
	
	//컨트롤러 vendorProductDetailList >> vendorProductDetailListPage(jsp vendorProductListPage에서도 변경)
	//서비스 getProductList2 >> getProductListByProductNo
	//상품 상세페이지
	@RequestMapping("vendorProductDetailListPage")
	public String vendorProductDetailListPage(Model model, int product_no, HttpSession session) {
		
		HashMap<String, Object> productList = vendorService.getProductListByProductNo(product_no);
		ArrayList<HashMap<String, Object>> titleList = vendorService.getTitleImageList(product_no);
		ArrayList<HashMap<String, Object>> detailList = vendorService.getDetaileImageList(product_no);
		
		model.addAttribute("data", productList);
		model.addAttribute("title", titleList);
		model.addAttribute("detail", detailList);

		ProductVo productVo = (ProductVo)productList.get("productVo");
		int vendorNo = productVo.getVendor_no();
		VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(vendorNo);

		String vendor_brand_name = vendorVo.getVendor_brand_name();
		
		model.addAttribute("dataList",vendor_brand_name);

		return "vendor/vendorProductDetailListPage";
	}
	
	//컨트롤러 vendorProductList >> vendorProductListPage(jsp vendorMainPage에서도 변경) - 검색 form링크 변경
	//서비스 getProductList >> getProductListByVendorNo
	//해당 판매자 물품 리스트 불러오기
	@RequestMapping("vendorProductListPage")
	public String vendorProductListPage
	(Model model, HttpSession session, 
	String searchType, String searchWord,
	@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {

		VendorVo vendorVo = (VendorVo)session.getAttribute("vendorInfo");
		 int vendor_no = vendorVo.getVendor_no();
		
		ArrayList<HashMap<String, Object>> dataList = 
		vendorService.getProductListByVendorNo(vendor_no,searchType,searchWord,pageNum);
		
		model.addAttribute("dataList",dataList);
		
		int productCount = vendorService.getProductCount(vendor_no, searchType, searchWord);
		
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
		
		return "vendor/vendorProductListPage";
	}
	
	//컨트롤러 vendorOrderList >> vendorOrderListPage (jsp vendorMainPage에서도 변경) - 검색 링크 변경
	//전체 오더리스트 묶은 것
	@RequestMapping("vendorOrderListPage")
	public String vendorOrderListPage
	(Model model, HttpSession session,
	String searchType, String searchWord,
	@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		
		VendorVo vendorVo = (VendorVo)session.getAttribute("vendorInfo");
		int vendorNo = vendorVo.getVendor_no();
		
		ArrayList<OrderVo> orderVoList = vendorService.getVenderOrderList(searchType,searchWord,pageNum);

		ArrayList<HashMap<String, Object>> OrderDetailList = 
				new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> pageOrder = new HashMap<String, Object>();
		
		for(OrderVo orderVo : orderVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			OrderDetailList = 
			vendorService.getOrderDetailList(orderVo.getOrder_no(), vendorNo);
			
			if (!OrderDetailList.isEmpty()) {
				int customerNo =  orderVo.getCustomer_no();
				CustomerVo customerVo = vendorService.getCustomerList(customerNo);
				
				map.put("customerVo", customerVo);
				map.put("orderVo", orderVo);
				map.put("orderDetailList", OrderDetailList);
				
				pageOrder.put("orderVo", orderVo);
				dataList.add(map);
			}

		}
		
		model.addAttribute("dataList", dataList);
		
		int orderCount = vendorService.getOrderCount(searchType, searchWord);
		
		//올림처리
		int totalPageCount = (int)Math.ceil(orderCount/10.0);

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
		
		
		
		return "vendor/vendorOrderListPage";
	}
	
	//컨트롤러 vendorOrderDetailList >> vendorOrderDetailListPage (jsp vendorOrderListPage에서도 변경)
	//서비스 getVenderOrderList2 >> getVenderOrderListByOrderNo
	//판매자 주문 상세페이지
	@RequestMapping("vendorOrderDetailListPage")
	public String vendorOrderDetailListPage(int order_no, Model model, HttpSession session) {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		
		VendorVo vendorVo = (VendorVo)session.getAttribute("vendorInfo");
		int vendorNo = vendorVo.getVendor_no();
		
		ArrayList<OrderVo> orderVoList = vendorService.getVenderOrderListByOrderNo(order_no);
		
		ArrayList<HashMap<String, Object>> OrderDetailList = 
				new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> pageOrder = new HashMap<String, Object>();
		
		for(OrderVo orderVo : orderVoList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			OrderDetailList = 
			vendorService.getOrderDetailList(orderVo.getOrder_no(), vendorNo);
			
			if (!OrderDetailList.isEmpty()) {
				
				int customerNo =  orderVo.getCustomer_no();
				CustomerVo customerVo = vendorService.getCustomerList(customerNo);
				
				map.put("customerVo", customerVo);
				map.put("orderVo", orderVo);
				map.put("orderDetailList", OrderDetailList);
				
				pageOrder.put("orderVo", orderVo);
				dataList.add(map);
			}

		}
		
		model.addAttribute("dataList", dataList);
	
		return "vendor/vendorOrderDetailListPage";
	}
	
	@RequestMapping("updateReVendor")
	public String updateReVendor(VendorVo vendervo) {
		vendorService.updateReVendor(vendervo);
		return "vendor/vendorLoginPage";
	}
	
	@RequestMapping("mailAuthProcess")
	public String mailAuthProcess(String auth_Key) {
		
		vendorService.vendorMailAuth(auth_Key);
		
		return "vendor/vendorLoginPage";
	}
	
}
