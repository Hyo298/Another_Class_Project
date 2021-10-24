<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	a:link, a:visited{text-decoration:none;color:#333;}
	#hQnAD{width:1200px;height:auto;margin:0 auto;}
	.hQnAT{width:100%;text-align:center;font-size:32px;font-weight: bold;color:#333;margin:40px 0 40px 0;}
	
	/*리스트*/

	#hQnWrite{width:100%;margin:0 auto;}
	#hQnAList{width:100%;height:auto;margin:0 auto;overflow:auto;}
	#hQnAListUl{width:100%;text-align:center;height:auto;overflow:auto;}
	
	.hQnAListFli10,.hQnAListFli{float:left;width:10%;height:60px;line-height:60px;border-bottom:1px solid #ddd;}
	.hQnAListFli1,.hQnAListFli101{width:10%}
	.hQnAListFli2,.hQnAListFli102{width:56%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;text-align:left;}
	.hQnAListFli4,.hQnAListFli104{width:14%}
	
	.hQnAListFli{border-bottom:1px solid black;margin-top:10px;background-color:#f0f0f0;font-weight:bold;font-size:1.1rem;} /*리스트타이틀*/	

	#hQnWrite{height:auto;text-align:right;margin-bottom:15px;margin-top:10px;padding-right:7px;}/*글쓰기 버튼div*/
	#hQnWritelab{padding:7px 15px 7px 15px;background-color:#464646;font-size:18px;}/*글쓰기 버튼div*/

	.replySubject{text-align:left;}	
	
	.hQnAList-button>a:hover{color:ff385c;}
	.hQnAList-button>a:active{color:ff385c;}
	
</style>
<script>

	$(()=>{

		
		$("#hQnWritelab").click(function(){
			var logid = "${userId}";
	    	console.log(logid);
			if(logid=== null || logid=== ""){
				alert("로그인 후 문의작성 가능합니다");
			}else{
				location.href="/another/HomeQnAAsk/write"
			}	    	
		});
		
		
	});
	</script>
<!-- class_qna_no, class_no, classQna_member_id, classqna_content, to_char(a.classqna_writedate,'YY-MM-DD') classqna_writedate, class_name -->
	
	
	<div id="hQnAD">
	<div class="hQnAT">홈페이지문의</div> <!-- 페이지 타이틀 -->
	<!-- <div id="hQnWrite"><label id="hQnWritelab"><a href="<%=request.getContextPath()%>/HomeQnAAsk/write" style="color:white;">문의하기</a></label></div> <!-- 글쓰기버튼 -->
	<div id="hQnWrite"><label id="hQnWritelab" style="color:white;">문의하기</label></div> <!-- 글쓰기버튼 -->
	<div id="hQnAList"> <!-- 게시판리스트 -->
		<ul id="hQnAListUl">
			<li  class="hQnAListFli hQnAListFli1">No.</li>
			<li  class="hQnAListFli hQnAListFli2" style="text-align:center">글제목</li>
			<li  class="hQnAListFli hQnAListFli3">작성자</li>
			<li  class="hQnAListFli hQnAListFli4">작성일자</li>
			<li  class="hQnAListFli hQnAListFli5">답변여부</li>
		
		<c:forEach var="vo" items="${list }">	
		
			<!-- 글번호 -->
			
			<li class="hQnAListFli10 hQnAListFli101">${vo.class_qna_no}</li>			
	
			<li class="hQnAListFli10 hQnAListFli102"><a href="<%=request.getContextPath()%>/HomeQnAAsk/view">${vo.class_no}</a></li>
	
		
			<li class="hQnAListFli10 hQnAListFli103">${vo.classQna_member_id }</li>
			<li class="hQnAListFli10 hQnAListFli104">${vo.classqna_writedate}</li>
			
			<!-- 답변여부: 답변완료/미답변 <li class="hQnAListFli10 hQnAListFli105">${vo.replycount}</li> -->
		
			<li class="hQnAListFli10 hQnAListFli105">답변완료</li>
		
		
			
		</c:forEach>
		</ul>
			<div class="hQnAList-button" style='text-align:center;margin-top:50px;'>
				<!-- 페이징 -->
			</div>
			
	</div>
</div>