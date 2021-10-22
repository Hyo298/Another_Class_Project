package com.anotherclass.bitcamp.controller.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.user.UserPayService;
import com.anotherclass.bitcamp.vo.user.BasketVO;
import com.anotherclass.bitcamp.vo.user.UserPayVO;


@Controller
public class UserPayController {
	@Inject 
	UserPayService userPayService;

	//결제페이지
	@RequestMapping(value= "/PayPage", method = RequestMethod.POST)
	public ModelAndView payPage(UserPayVO vo ) {//주문할 클래스옵션번호			
		ModelAndView mav = new ModelAndView();
		
		//포인트셋팅해서 list 에넣기.......
		List<UserPayVO> list2 =  userPayService.userPayAllselect(vo.getClassNoPayList());
		for(int i=0; i<list2.size(); i++) {
			UserPayVO vo3=list2.get(i);
			int a = vo3.getClass_price();
			double b = a*0.01;
			int c = (int)Math.round(b);
			vo3.setSavePoint(c);
		}		
		mav.addObject("list",list2); 				
		
		//총가격
		List<UserPayVO> list =  userPayService.userPayAllselect(vo.getClassNoPayList());		
		int sum = 0;
		for(int i=0; i<list.size(); i++) {
			UserPayVO vo2=list.get(i);
			sum += vo2.getClass_price();
		}
		System.out.println(sum);		
		mav.addObject("sum", sum);				
		
		//총포인트	
		int sum2 = 0;
		for(int i=0; i<list2.size(); i++) {
			UserPayVO vo4=list2.get(i);
			sum2 += vo4.getSavePoint();
		}
		System.out.println(sum2);		
		mav.addObject("sum2", sum2);	
		
		mav.setViewName("/user/pay/payPage_info");
		return mav;
	}
	
	//개별결제페이지
	@RequestMapping(value= "/PayPage2", method = RequestMethod.POST)
	public ModelAndView payPage2(int no) {//주문할 클래스옵션번호		
		ModelAndView mav = new ModelAndView();
		List<UserPayVO> list8=  userPayService.userPayoneSelect(no);
		
			UserPayVO vo2=list8.get(0);
			int a = vo2.getClass_price();
			double b = a*0.01;
			int c = (int)Math.round(b);
			vo2.setSavePoint(c);//적립포인트
			
		mav.addObject("list",vo2); 			
		mav.setViewName("/user/pay/payPage_info");
		return mav;
	}
	//결제페이지정보
	@RequestMapping("/memInfo")
	@ResponseBody
	public UserPayVO ajaxMemInfo(String logid) {
		UserPayVO vo =  userPayService.userInfo(logid);
		return vo;
		
	}
	//장바구니저장후...
	@RequestMapping(value="/basketResult")
	public String basketResult() {
		return "/result/BasketResult";
	}
	//정바구니버튼누르면 ....디비에저장하고 돌아감
	@RequestMapping("/InsertBasketDB")
	@ResponseBody
	public ModelAndView ajaxInsertBasket(UserPayVO vo, HttpSession session) {//장바구니 테이블에 insert 할클래스번호
		
		ModelAndView  mav = new ModelAndView();
		
		String member_id = (String)session.getAttribute("userId"); 
		BasketVO bvo = new BasketVO();
		int[]te= vo.getClassNoPayList();
		bvo.setMember_id(member_id);
		bvo.setHeadcount(1);
		
		int cnt = 0;
		for(int i=0; i<te.length; i++) {
			bvo.setClass_option_no(te[i]);
			cnt = userPayService.testBasket(bvo);//디비에저장함
		}
		
		System.out.println(cnt);
		mav.addObject("cnt",cnt);
		mav.setViewName("redirect:basketResult");
		return mav;
		
	}
	//선택상품삭제
	@RequestMapping("/DeleteBasketDB")
	public ModelAndView basketDel(UserPayVO vo, HttpSession session) {
		
		ModelAndView  mav = new ModelAndView();
		String member_id = (String)session.getAttribute("userId"); 
		BasketVO bvo = new BasketVO();
		int[]te= vo.getClassNoPayList();
		bvo.setMember_id(member_id);
		
		
		int cnt = 0;
		for(int i=0; i<te.length; i++) {
			bvo.setClass_option_no(te[i]);
			cnt = userPayService.delBasket(bvo);//디비에서삭제
		}
		
		System.out.println(cnt);
		mav.addObject("cnt",cnt);
		mav.setViewName("redirect:basketResult");
		return mav;
		
	}
	//개별상품삭제 ///another/delOneClass
	@RequestMapping("/delOneClass")
	@ResponseBody
	public int DelOneClass(int no) {
		int result =0;
		result = userPayService.delOneBasket(no);
		System.out.println("개별상품삭제"+result);
		return result;
	}
	
	//결제하고나서오는곳
	@RequestMapping("/SaveOrder")
	@ResponseBody
	public int saveOrder(String imp_uid, String merchant_uid) {
		int result = 0;
		System.out.println(imp_uid);
		System.out.println(merchant_uid);
		return result;
	}
	
	//결제하고나서오는곳2 -> 상품한개//카드
	@RequestMapping("/SaveOrder2")
	@ResponseBody
	public int saveOrder2(String imp_uid,String merchant_uid,String total_price,String card_num,int class_option_no,HttpSession session) {
		String member_id = (String)session.getAttribute("userId"); 
		int result = 0;
		UserPayVO vo = new UserPayVO();
		vo.setMember_id(member_id);
		vo.setClass_option_no(class_option_no);
		//headcount
		//use_point
		vo.setTotal_price(Integer.parseInt(total_price));
		
		double a = vo.getTotal_price()*0.01;
		int b = (int)Math.round(a);
		vo.setCharge(b);
		
		vo.setCard_num(card_num);
		vo.setMerchant(merchant_uid);
		
		result = userPayService.oneClassOrder(vo);//오더테이블저장
		int aaa =userPayService.addHeadCount(class_option_no);//옵션클래스신청인원 +1 
		System.out.println("신청인원증가"+aaa);
		//사용자포인트 증가,감소
		
		return result;
	}
	
	
}
