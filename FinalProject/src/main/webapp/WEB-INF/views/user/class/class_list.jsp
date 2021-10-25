<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
$(function(){
////////////////////범위 바	
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 150000,
      values: [ 20000, 60000 ],
      slide: function( event, ui ) {
        $( "#min_price_show" ).val(ui.values[ 0 ]);
        $( "#max_price_show" ).val(ui.values[ 1 ]);
      }
    });
    
    $( "#min_price_show" ).val( $( "#slider-range" ).slider( "values", 0 ));
    $( "#max_price_show" ).val( $( "#slider-range" ).slider( "values", 1 ));
  
  });
 ///////////////////////////////// 아작스  
	var classNo_arry = new Array();
 	var	className_arry = new Array();
 	var classAddr1_arry = new Array();
 	var classPrice_arry = new Array();
 	var classThumb_arry = new Array();
 	var classTag_arry = new Array();
 	var class_content_arry = new Array();
 	var category_no = new Array();
	var category_name = new Array();
	var startDate_arry = new Array();
//////////////////////////////////// 낮은 가격순	
 function sortByPrice(){
	  var url = '<%=request.getContextPath()%>/classList/sortPrice';
	  var params = {"no": 0};
	  $.ajax({
		 	url : url,
			data : params,
			async:false,
			success:function(r){
				var rr=$(r);
				$('.middle_container').html('');
				var classDiv = '';
				rr.each(function(idx){
					
					classNo_arry[idx] = rr[idx].class_no;
	 				className_arry[idx]= rr[idx].class_name;
	 			 	classAddr1_arry[idx]= rr[idx].class_addr1;
	 			 	classPrice_arry[idx]= rr[idx].class_price;
	 			 	classThumb_arry[idx]= rr[idx].class_thumb;
	 			 	classTag_arry[idx]= rr[idx]. class_tag;
	 			 	class_content_arry[idx]= rr[idx].class_content;
					category_name[idx]= rr[idx].category_name;
					startDate_arry[idx]=rr[idx].start_date;
					
					classDiv  = '<div class="class_div">';
					classDiv += '<div class="img_div">';
					classDiv +=	'<img class="img_size" src="<%=request.getContextPath()%>/img/kimin/maca.png">';
					classDiv += '</div>';
					classDiv +=	'<div class="info_div">';
					classDiv += '<ul>';
					classDiv += '<li><div>'+ category_name[idx]+'</div></li>';
					classDiv += '<li>'+className_arry[idx]+'</li>';
					classDiv +=	'<li>'+classTag_arry[idx]+'</li>'
					classDiv +=	'<li>'+startDate_arry[idx]+'</li>';
					classDiv +=	'<li>'+classPrice_arry[idx]+'원</li>';
					classDiv += '</ul>';
					classDiv +='</div>';
					classDiv +='</div>';
					$('.middle_container').append(classDiv);
					});
			},error:function(e){
				console.log("ajax 에러")
			}
			
	  });
  };
  ///////////////////////////가까운 시작일
 function sortByADate(){
	  var url = '<%=request.getContextPath()%>/classList/sortDate';
	  var params = {"no": 1};
	  $.ajax({
		 	url : url,
			data : params,
			async:false,
			success:function(r){
				var rr=$(r);
				$('.middle_container').html('');
				var classDiv = '';
				rr.each(function(idx){
					
					classNo_arry[idx] = rr[idx].class_no;
	 				className_arry[idx]= rr[idx].class_name;
	 			 	classAddr1_arry[idx]= rr[idx].class_addr1;
	 			 	classPrice_arry[idx]= rr[idx].class_price;
	 			 	classThumb_arry[idx]= rr[idx].class_thumb;
	 			 	classTag_arry[idx]= rr[idx]. class_tag;
	 			 	class_content_arry[idx]= rr[idx].class_content;
	 			 	category_name[idx]= rr[idx].category_name;
	 			 	startDate_arry[idx]=rr[idx].start_date;
	 			 	
					classDiv  = '<div class="class_div">';
					classDiv += '<div class="img_div">';
					classDiv +=	'<img class="img_size" src="<%=request.getContextPath()%>/img/kimin/maca.png">';
					classDiv += '</div>';
					classDiv +=	'<div class="info_div">';
					classDiv += '<ul>';
					classDiv += '<li><div>'+ category_name[idx]+'</div></li>';
					classDiv += '<li>'+className_arry[idx]+'</li>';
					classDiv +=	'<li>'+classTag_arry[idx]+'</li>'
					classDiv +=	'<li>'+startDate_arry[idx]+'</li>';
					classDiv +=	'<li>'+classPrice_arry[idx]+'원</li>';
					classDiv += '</ul>';
					classDiv +='</div>';
					classDiv +='</div>';
					$('.middle_container').append(classDiv);
					});
			},error:function(e){
				console.log("ajax 에러")
			}
			
	  });
  };
  
</script>

<style>
.main_container{ background-color:;
	width:1200px;
	height:1400px;
	margin:0 auto;
}
.top_container{ background-color:;
	width:100%;
	height:130px;
	margin-top:30px;
}
.page_name a{
	background-color:; 
	border:1px dotted lightgray;
	border-radius:8px;
	width:64%;
	height:100px;
	float: left;
	text-align: center;
	color:#FF385C;
	display: table-cell;
	font-weight: 500;
	font-size: 2em;
	line-height: 100px;
}
.select_boxes{background-color:;
	width:35%;
	height:100px;
	margin:0px 10px 0px 0;
	float: right;
}
.select_boxes>select{background-color:white;
 	border:1px dotted gray;
	height:30px;
	width:49.5%;
	border-radius:8px;
	font-weight: 500;
	color:gray;
}
.select_boxes>select>option:nth-child(1){
	text-align: center;
}
.select_boxes>select>option{
	background-color: white;
}
.select_range{background-color:;
 	width:420px;
 	height:30px;
}
.select_range li{
	float:left;
}
.priceRangeBox{ 
	border:1px dotted gray;
	width:100px;
	height:30px;
	text-align: center;
	border-radius:8px;
	font-weight: 500;
	background-color:white;
	margin-top:5px;
	color:gray;
}
input[type=submit]{
	color:#FF385C;
	cursor: pointer;
	float: right;
	width:100%;
}
input[type=submit]:hover{
	background-color:#FF385C;
	color:white;
}
#slider-range{background-color:; 
	margin:10px 5px 0 5px;
	width:210px;
	height:10px;
	
}
.ui-slider-range{
	background-color:#FF385C;
	color:red;
}
.middle_container{ background-color:;
	width:100%;
	height:1100px;
}
.middle_top_select{ background-color:;
	border-top:2px solid lightgray;
	height:35px;
	widht:100%;
}
.middle_top_select>ul{background-color:;
	
	height:30px;
	float: right;
}.middle_top_select>ul>li{
	text-align: center;
	float: right;
	font-size: 0.8em;
	font-weight: 500;
	line-height: 40px;
	color:gray;
}

.middle_top_select>ul>li:not(:nth-child(2)){
	width:100px;
}
.class_div{ border:1px dotted lightgray;
	float:left;
	width:23%;
	height:350px;
	margin:1% 1% 1% 1%;
	border-radius:8px;
	padding:5px 5px 5px 5px;
}
.img_div{ border:1px dotted lightgray;
	width:100%;
	height:53%;
	border-radius:8px;
	margin:0 auto;
	overflow:hidden;
	
}
.img_size{
	width:100%;
	heigth:100%;
	object-fit:cover;
}
.info_div{border:1px dotted lightgray;/* 정보 div */
	width:100%;
	height:42%;
	padding:5px 5px 5px 5px;    
	border-radius:8px;
	margin-top:5%;
}
.info_div>ul{background-color:;
	float:right;
	width:100%;
}
.info_div li:not(:nth-child(1)){
	text-align:right;
	width:100%;
	
}
.info_div>ul>li:nth-child(1)>div {
	background-color:#FF385C; /* 카테고리 정보 div */
	border-radius:8px;
	display:inline-block;
	padding:0 10px 0 10px;
	color:white;
}
.info_div>ul>li:nth-child(2) {
	font-weight: 500;
	overflow: hidden;
	display:inline-block;
	max-height: 24px;
	color:gray;
}
.info_div>ul>li:nth-child(3) {
	font-weight: 400;
	color:gray;
	border:1px dotted #00B9B1;
	color:#00B9B1;
	border-radius:6px;
	overflow: hidden;
	height:28px;
}
.info_div>ul>li:nth-child(4) {
	font-weight: 500;
	color:gray;
	color:#FF385C;
}
.info_div>ul>li:nth-child(5) {
	font-weight: 500;
	color:gray;
}
.info_div>ul>li:nth-child(6) { /* 클래스 넘버 숨겨둠*/
	display: none;
}
.price_sort, .apply_sort{
	cursor: pointer;
}
</style>

<div class="main_container">
	<form action="">
		<div class="top_container">
			<div class="page_name">
				<label><a href="<%=request.getContextPath()%>/classList">Class list</a></label>
			</div>
			<div class="select_boxes">
					<select>
						<option>카테고리</option>
						<c:forEach var="cate" items="${cla }">
							<option >${cate.category_name }</option>  <!-- 디비 반복 -->
						</c:forEach>
					</select>
					<select>
						<option>지역</option>
						<c:forEach var="loca" items="${cla }">
							<option >${loca.class_addr1 }</option>  <!-- 디비 반복 -->
						</c:forEach>
					</select>
					<div class="select_range">	
						<ul>
							<li><input class="priceRangeBox" type="text" id="min_price_show" readonly name="min_price_show"></li>
							<li><div id="slider-range"></div></li>
							<li><input class="priceRangeBox" type="text" id="max_price_show" readonly name="max_price_show"></li>
						</ul>
					</div>
				<input type="submit" value="검색" class="priceRangeBox">	
			</div>
		</div>
	</form>
	<div class="middle_top_select"> <!--  -->
		<ul>
			<li class="price_sort" onclick="sortByPrice()">낮은 가격순</li>
			<li>|</li>
			<li class="apply_sort" onclick="sortByADate()">가까운 시작순</li>
		</ul>
	</div>
	<div class="middle_container">
		<c:forEach var="vo" items="${cla }">
		<div class="class_div">
			<div class="img_div">
				<img class="img_size" src="<%=request.getContextPath()%>/img/kimin/maca.png">
			</div>
			<div class="info_div">
				<ul>
					<li><div>${vo.category_name }</div></li>
					<li>${vo.class_name }</li>
					<li>${vo.class_tag }</li>
					<li>${vo.class_price }원</li>
					<li>${vo.start_date }</li>
					<li>${vo.class_no }</li> <!-- 클래스 넘버 숨겨둠 -->
				</ul>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
