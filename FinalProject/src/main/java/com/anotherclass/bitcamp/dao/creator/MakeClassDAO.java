package com.anotherclass.bitcamp.dao.creator;

import java.util.List;

import com.anotherclass.bitcamp.vo.creator.CreatorClassCategoryVO;
import com.anotherclass.bitcamp.vo.creator.CreatorMakeClassVO;

public interface MakeClassDAO {
	public int makeClassApply(CreatorMakeClassVO vo);//insert 클래스 등록
	//public List<CreatorMakeClassVO> modifyClass();
	public List<CreatorClassCategoryVO> makeClassCategoryL();
	public List<CreatorClassCategoryVO> makeClassCategoryS(int no);
}