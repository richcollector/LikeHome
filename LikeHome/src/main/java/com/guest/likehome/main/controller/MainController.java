package com.guest.likehome.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guest.likehome.help.mapper.HelpSQLMapper;
import com.guest.likehome.help.service.HelpServiceImpl;
import com.guest.likehome.main.service.MainServiceImpl;
import com.guest.likehome.product.service.ProductServiceImpl;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.HelpQnaTypeVo;
import com.guest.likehome.vo.HelpQnaVo;

@Controller
@RequestMapping("/main/*")
public class MainController {

   @Autowired
   private HelpServiceImpl helpService;   

   @Autowired
   private MainServiceImpl mainServiceImpl;
   
   @Autowired
   private ProductServiceImpl productServiceImpl;
   
   @RequestMapping("vendorLoginPage")
   public String vendorLoginPage() {
      
      return "main/vendorLoginPage";
   }
   
   @RequestMapping("mainPage")
   public String mainPage(Model model) {
      
      HashMap<String, Object> data = mainServiceImpl.mainPageData();
      
      model.addAttribute("data", data);
      model.addAttribute("productData", productServiceImpl.getTodayBestProductList());
      
      return "main/mainPage";
   }
   
   @RequestMapping("main/helpQnaWritePage")
   public String helpQnaWritePage(Model model) {
      
      return "main/helpQnaWritePage";
   }
   
   @RequestMapping("helpQnaWriteProcess")
   public String helpQnaWriteProcess(HelpQnaVo param , HttpSession session) {
      
      CustomerVo userinfo = (CustomerVo)session.getAttribute("customerInfo");
      int customerNo = userinfo.getCustomer_no();
      param.setCustomer_no(customerNo);
      helpService.registerHelpQna(param);

      return "redirect:../customer/customerMyHelpQnaPage";
   }
   
   @RequestMapping("helpQnaBoardPage")
   public String helpQnaList(Model model , String value) {
      
      ArrayList<HashMap<String, Object>> dataList = helpService.getHelpQnaDataList(value);
      model.addAttribute("dataList" , dataList);
      

      return "main/helpQnaBoardPage";
   }
   
   
   @RequestMapping("helpQnaBoardViewPage")
   public String helpQnaBoardViewPage(int help_qna_no, Model model) {
      HashMap<String, Object> data = helpService.getHelpQnaData(help_qna_no);
      
      HelpQnaVo helpQnaVo = (HelpQnaVo)data.get("helpQnaVo");
      String content = helpQnaVo.getHelp_qna_content();
      content = StringEscapeUtils.escapeHtml4(content);
      content = content.replaceAll(" ", "&nbsp;");
      content = content.replaceAll("\n", "<br>");
      helpQnaVo.setHelp_qna_content(content);
      String answerContent = helpQnaVo.getHelp_qna_answer_content();
      if(answerContent != null) {
         answerContent = StringEscapeUtils.escapeHtml4(answerContent);
         answerContent = answerContent.replaceAll(" ", "&nbsp;");
         answerContent = answerContent.replace("\n", "<br>");
         helpQnaVo.setHelp_qna_answer_content(answerContent);
      } else {
         
      }
      
      model.addAttribute("data", data);
      
      return "main/helpQnaBoardViewPage";
   }
   
   @RequestMapping("deleteHelpQnaBoard")
   public String deleteHelpQnaBoard(int help_qna_no) {
      helpService.deleteHelpQnaBoard(help_qna_no);
      return "redirect:./helpQnaBoardPage";
   }
   
   @RequestMapping("helpQnaUpdatePage")
   public String helpQnaUpdatePage(int help_qna_no, Model model) {
      HashMap<String, Object> data = helpService.getHelpQnaData(help_qna_no);
      
      model.addAttribute("data", data);
      
      return "main/helpQnaUpdatePage";
   }
   
   @RequestMapping("updateHelpQnaBoard")
   public String updateHelpQnaBoard(HelpQnaVo param) {
      helpService.updateHelpQnaTitleAndContent(param);
      return "redirect:./helpQnaBoardPage";
   }
   
   
   @RequestMapping("searchResultPage")
   public String searchResultPage(Model model) {
	   
	   model.addAttribute("resultDataList", productServiceImpl.getSearchedProduct());
	   return "main/searchResultPage";
   }
   
}