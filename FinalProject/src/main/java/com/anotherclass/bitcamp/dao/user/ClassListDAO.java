package com.anotherclass.bitcamp.dao.user;

import java.util.List;

import com.anotherclass.bitcamp.vo.user.ClassListVO;

public interface ClassListDAO {
	public List<ClassListVO> ClassList();
	public List<ClassListVO> sortByPrice(ClassListVO vo);
	public List<ClassListVO> sortByApplyDate(ClassListVO vo);
	
}