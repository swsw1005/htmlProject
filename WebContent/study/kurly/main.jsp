<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   body {margin:0;}
   #first {
     width:1000px;
     height:40px;
     background:#5c0080;
     margin:auto;
     color:white;
   }
   #first #left {  
     width:970px;
     height:40px;
     float:left;
     display:flex;
     justify-content:center;
     align-items:center;
   }
   #first #right {
     width:30px;
     height:40px;
     float:right;
     display:flex;
     justify-content:center;
     align-items:center;
     cursor:pointer; /* 마우스가 올라왔을때 마우스 포인터 모양 */
   } 
   #second {
     width:1000px;
     height:30px;
     margin:auto;
   }
   #second #left {
     float:left; 
     height:30px;
     display:flex;
     align-items:center;
   }
   #second #left #left_in {
     width:180px;
     height:20px;
     border:1px solid #cccccc;
     border-radius:13px;
     display:flex;
     justify-content:center;
     align-items:center;
     font-size:12px;
   }
   #second #right {
     height:30px;
     float:right;
     font-size:12px;
     /* display:flex;
     align-items:center; */
   }
   #second #right > ul > li {
     list-style-type:none;
     float:left;
     width:100px;
   }
   #second #right #sub {  /*   고객센터 메뉴 ul */
     width:100px;
     height:110px;
     padding:4px;
     border:1px solid black;
     background:white;
     display:none;
     z-index:100;
     position:relative;
   }
   #second #right #sub li {
     list-style-type:none;
     margin-top:4px;
   }
   #second #aa {
     color:purple;
   }
   #third {
     width:1000px;
     height:60px;
     margin:auto;
     text-align:center;
   }
   #fourth {
     width:1000px;
     height:40px;
     margin:auto;
     position:relative;
     background:white;
   }
   #fourth > ul {
     padding-left:0px;
   }
   #fourth > ul > li {
     float:left;
     list-style-type:none;
     width:140px;
     height:60px;
   }
   #fourth > ul > li:last-child {
     width:20px;
   }
   #fourth > ul > li:first-child {
     width:180px;
   }
   #fourth > ul > li:nth-child(6) {
     width:235px;
   }
   #fourth > ul > li #search {
     width:210px;
     height:26px;
     border:1px solid #eeeeee;
     display:flex;
     align-items:center;
     border-radius:12px;
     background:#eeeeee;
   }
   #fourth > ul > li #search input {
     border:none;
     background:#eeeeee;
   }
   #fourth #sub { /* #fourth > ul > li > ul */
     padding-left:0px;
     width:150px;
     height:510px;
     border:1px solid #dddddd;
     background:white;
     margin-Top:19px;
     display:none;
   }
   #fourth #sub li {
     list-style-type:none;
     margin-top:10px;
     padding-left:8px;
   }
    
 </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(function()
    {
    	// 1층 사라지기
    	$("#first #right").click(function() 
    	{
    		//$("#first").css("display","none");
    		//$("#first").slideUp();
    		$("#first").fadeOut();
    	});
    	
    	// 택배배송 글자 변환시키기
    	var chk=0; 
    	var str=["서울.경기.인천 <b id=aa> 샛별배송 </b>","수도권 이외 지역  <b id=aa> 택배배송 </b>"];
    	//             배열에 값을 입력
    	
    	setInterval(function() 
    	{
    		/* if(chk%2 == 0)
    	   	  $("#second #left #left_in").html(str[0]);// innerHTML
    	   	else
    	   	  $("#second #left #left_in").html(str[1]); */
    	   	var n=chk%2;
    	   	$("#second #left #left_in").html(str[n]);
    	   	chk++;
    	},1000);
    	
    	$("#cust").mouseover(function()
    	{
    		$("#cust #sub").show();
    		//$("#sub").slideDown();
    	}); //  하위메뉴 보이기
    	$("#cust").mouseout(function()
    	{
    		$("#cust #sub").hide();
    		//$("#sub").slideUp();
    	});  // 하위메뉴 숨기기
    	
    	$("#main").mouseover(function()
    	{
    		$("#main #sub").show();
     	}); //  전체카테고리 보이기
    	$("#main").mouseout(function()
    	{
       		$("#main #sub").hide();
    	});  // 전체카테고리 숨기기
    	
    	$(window).scroll(function() 
    	{
    		//$("#zz").text(innerWidth);
    		//$("#zz").text($(window).scrollTop());
    		if($(window).scrollTop() < 140 )
    		{
    			$("#fourth").css("position","relative");
    			$("#fourth").css("left","0px");
    		}	
    		else
    		{
    			$("#fourth").css("position","fixed");
    			$("#fourth").css("top","0px");
    			if(innerWidth <= 1000)
    				$("#fourth").css("left","0px");
    			else
    			{
    				var n=innerWidth-1000;
    				n=(n/2)-11;
    				$("#fourth").css("left",n);
    			}	
    		}
    	});
    	
    	if(innerWidth < 1280)  // 브라우저의 가로크기 1280보다 적으면
  		  $("#right_menu").hide();  // 오른쪽 메뉴 숨기기
  	    else  // 가로크기 1280보다 크다
  	    {
  		  $("#right_menu").show();  // 오른쪽 메뉴 보이기
  		  var w=innerWidth-100;
  		  $("#right_menu").css("left",w+"px");
  	    }  // 문서를 읽을때
		
    	$(window).resize(function()  // 이벤트 발생시
    	{
    	  if(innerWidth < 1280)
    		  $("#right_menu").hide();
    	  else
    	  {
    		  $("#right_menu").show();
    		  var w=innerWidth-100;
    		  $("#right_menu").css("left",w+"px");
    	  }
    	});
    });
  </script>
</head>
<body>
  <div id="first">  <!-- 1층 -->
     <div id="left"> 지금 가입하고 인기상품 100원에 받아가세요! > </div>    
     <div id="right"> X </div>
  </div>
  <div id="second">  <!-- 2층 -->
     <div id="left"> 
       <div id="left_in"> <!-- 외곽선 -->
               수도권 이외 지역  <b id="aa">택배배송</b>  <!-- 서울.경기.인천 샛별배송 -->
       </div>
     </div>
     <div id="right">
        <ul>
          <li> 회원가입 </li>
          <li> 로그인 </li>
          <li id="cust" style="position:relative"> 
                        고객센터 
             <ul id="sub">
                <li> 공지사항 </li>
                <li> 자주하는 질문 </li>
                <li> 1:1 문의 </li>
                <li> 상품 제안 </li>
                <li> 에코포장 피드백 </li>
             </ul>
          </li>
          <li> 배송지역 검색 </li>
        </ul>
     </div>
  </div>
  <div id="third">  <!-- 3층 -->
     <img src="logo.png" width="90">
  </div>
  <div id="fourth"> <!-- 4층 -->
     <ul>
       <li style="position:relative" id="main">
                전체 카테고리 <span id="zz"></span>
         <ul id="sub">
           <li> 채소 </li>
           <li> 과일.견과.쌀 </li>
           <li> 수산.해산.건어물 </li>
           <li> 정육.계란 </li>
           <li> 국.반찬.메인요리 </li>
           <li> 샐러드.간편식 </li>
           <li> 면.양념.오일 </li>
           <li> 음료.우유.떡.간식 </li>
           <li> 베이커리.치즈.델리 </li>
           <li> 건강식품 </li>
           <li> 생활용품 </li>
           <li> 주방용품 </li>
           <li> 가전제품 </li>
           <li> 베이비.키즈 </li>
           <li> 반려동물 </li>
           <li> 컬리의 추천 </li>
         </ul> 
       </li>
       <li> 신상품 </li>
       <li> 베스트 </li>
       <li> 알뜰쇼핑 </li>
       <li> 이벤트 </li>
       <li> 
          <div id="search">
            <input type="text" placeholder="봄맞이 비타민 기획전">
            <img src="a.png">
          </div>
       </li>
       <li> <img src="b.png" width="25"> </li>
     </ul>
  </div>