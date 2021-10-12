package com.anotherclass.bitcamp.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.user.ClassDetailPageService;
import com.anotherclass.bitcamp.vo.user.tempMemberVO;
import com.anotherclass.bitcamp.vo.user.userClassDetailVO;

@Controller
public class ClassDetailPageController {
	@Inject
	ClassDetailPageService classDetailPageService;

	//클래스리스트--> 기민님이구현
	@RequestMapping("/user/classDetailPage/temporaryclasslist")
	public ModelAndView temporaryclasslist() { //가짜클래스목록
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",classDetailPageService.temporarylistAllSelect());
		mav.setViewName("user/classDetailPage/temporaryclasslist");
		return mav;		
	}
	
	//클래스상세페이지로이동
	@RequestMapping("/classDetailView")
	public ModelAndView classMainPage(int no) {//클래스 리스트에서 클래스명누르면 클레스상세페이지로이동
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",classDetailPageService.userClassDetailAllSelect(no));
		mav.setViewName("/user/classDetailPage/classMain2");
		return mav;
	}
	
	//달력에서 날짜선택 -> 클래스옵션리스트
	@RequestMapping("/classDetailDatePick")
	@ResponseBody
	public List<userClassDetailVO> ajaxDatePick(String datedate,String no){
		ModelAndView mav = new ModelAndView();
		List<userClassDetailVO> list = classDetailPageService.userSelectOptionAllSelect(datedate,no);
		return list;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("/user/templogin")
	public String loginForm() {
		return "/user/classDetailPage/temploginForm" ;
	}
	//-------------로그인
	@RequestMapping(value="/temploginOk", method=RequestMethod.POST)
	   public String loginOk(tempMemberVO vo, HttpSession ses) {
	      //로그인

	         ses.setAttribute("logid", "goguma123");
	        
	     
	      return "user/classDetailPage/temporaryhome";
	   }
//	   @RequestMapping("/logout")
//	   public String logout(HttpSession s) {
//	      s.invalidate();
//	      return "user/classDetailPage/temporaryhome";
//	   }
	
}