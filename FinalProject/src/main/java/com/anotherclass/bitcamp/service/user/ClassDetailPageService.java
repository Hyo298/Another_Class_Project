package com.anotherclass.bitcamp.service.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.anotherclass.bitcamp.vo.user.ClassVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO;
import com.anotherclass.bitcamp.vo.user.UserClassDetailVO2;

public interface ClassDetailPageService {
	public List<ClassVO> temporarylistAllSelect();//지울것
	public UserClassDetailVO userClassDetailAllSelect(int no);
	public List<UserClassDetailVO> userSelectOptionAllSelect(String datedate, int no);
	public UserClassDetailVO classLikeCount(int no);
	
	public int classLikeCheck(int no, String logid);
	public int classLikeInsert(int no, String logid);
	public int classLikeDelete(int no,String logid);
	
	public List<UserClassDetailVO2> userClassDetailAskAllSelect(int no);
	public int AskReplyCheck(int no); 
	public List<UserClassDetailVO2> userClassDetailAskReplySelect(int no);
}
