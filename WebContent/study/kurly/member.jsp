<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1층부터 4층까지 main.jsp라는 문서에 저장 -->    
<%@ include file="main.jsp" %>    
<style>
   #fifth{
     width:1000px;
     margin:auto;
     font-weight:bold;
   }
   #fifth #sub1 span {
     width:130px;
     display:inline-block;
     font-size:14px;
   }
   #fifth #main {
     width:700px;
     height:800px;
     /*border:1px solid black;*/
     margin:auto;
   }
   #fifth #main input[type=text]{
     width:300px;
     height:40px;
     border-radius: 3px;
     border:1px solid #cccccc;
   }
   #fifth #main input[type=password]{
     width:300px;
     height:40px;
     border-radius: 3px;
     border:1px solid #cccccc;
   }
   #fifth #main input[type=button]{
     width:150px;
     height:40px;
     border-radius: 3px;
   }
   #fifth #main #a1{
     background: #5f0080;
     border:1px solid #5f0080;
     color:white;
   }
   #fifth #main #a2{
     background:#cccccc;
     color:white;
     border:1px solid #cccccc;
   }
   #fifth #main #a3{
     background:white;
     color:#ccccc;
     border:1px solid #cccccc;
   }
   #fifth #main #sub1 li{
     list-style-type: none;
     height:50px;
   }
</style>
<div id="fifth">  <!-- 5층 -->
  <div id="main">
    <form name="pkc">
      <div align="center" style="font-size:20px"> 회원가입 </div>
      <div align="right" style="font-size:12px">  *필수입력사항 </div>
      <div>
        <ul id="sub1">
          <li>
            <span> 아이디 </span>
            <input type="text">
            <input type="button" value="중복확인" id="a1"> 
          </li>
          <li> 
            <span> 비밀번호 </span>
            <input type="password">
          </li>
          <li> 
            <span> 비밀번호확인 </span>
            <input type="password">
          </li>
          <li> 
            <span> 이름 </span>
            <input type="text"> 
          </li>
          <li>
            <span> 이메일 </span>
            <input type="text">
            <input type="button" value="이메일 중복확인" id="a1">
          </li>
          <li>
            <span> 휴대폰 </span>
            <input type="text">
            <input type="button" value="인증번호받기" disabled id="a2">
          </li>
          <li>
            <span> &nbsp; </span>
            <input type="text">
            <input type="button" value="인증번호확인" disabled id="a3">
          </li>
          <li> 
            <span> 배송주소 </span>
            <input type="button" value="주소검색" id="a1">
          </li>
          <li> 
            <span> 성별 </span>
            <input type="radio">남자
            <input type="radio">여자
            <input type="radio">선택안함
          </li>
          <li> 
            <span> 생년월일 </span>
            <div></div>
          </li>
          <li> 
            <span> 추가입력사항 </span>
            <input type="radio">추천인 아이디
            <input type="radio">참여 이벤트명
          </li>
        </ul>
      </div>
      <div>
      <script>
      function main_chk()
      {
         // name=main이 체크되면 => name=sub인것을 체크한다.
         // name=main이 체크해제되면 => name=sub인것을 체크해제한다.
         if(document.pkc.main.checked){// true,false
            for(i=0; i<document.pkc.sub.length; i++){
               document.pkc.sub[i].checked=true; // sub 체크
            }
              for(i=0;i<document.pkc.subsub.length; i++){
                 document.pkc.subsub[i].checked=true;
              }
         }else{
            for(i=0; i<5; i++){
               document.pkc.sub[i].checked=false; //sub 체크해제
            }
              for(i=0;i<document.pkc.subsub.length; i++){
                 document.pkc.subsub[i].checked=false;
              }
         } 
      }
      function sub_chk()
      {
         // sub가 전부 체크되었다면 main을 체크
         // sub에서 하나라도 체크가 해제되면 main은 체크해제
         var chk=0;
         for(i=0; i<document.pkc.sub.length; i++){
            if(document.pkc.sub[i].checked){
               chk++;
            }
            if(chk==5){
               document.pkc.main.checked=true;
            }else{
               document.pkc.main.checked=false;
            }
         }
         
         //sns, 이메일이 들어있는 체크박스
         if(document.pkc.sub[3].checked){
            for(i=0; i<2; i++){
               document.pkc.subsub[i].checked=true;
            }
         }else{
            for(i=0; i<2; i++){
               document.pkc.subsub[i].checked=false;
            }
         }
         
         /*
         var sub_chk=0;
         for(i=0; i<document.pkc.subsub.length; i++){
            if(document.pkc.subsub[i].checked){
               sub_chk++;
            }
            if(sub_chk==2){
               document.pkc.sub[3].checked=true;
            }else{
               document.pkc.sub[3].checked=false;
            }
         }
         
         var subsub0 = document.pkc.subsub[0].checked;
         var subsub1 = document.pkc.subsub[1].checked;
         
         if(subsub0&& subsub1){
            document.pkc.sub[3].checked = true;
         }else{
            docuemtn.pkc.sub[3].checked=false;
         }
         
         document.pkc.sub[3].style.background="cyan"
         */
         
      }
      function subsub_chk()
      {
         var sub_chk=0;
         for(i=0; i<document.pkc.subsub.length; i++){
            if(document.pkc.subsub[i].checked){
               sub_chk++;
            }
            if(sub_chk==2){
               document.pkc.sub[3].checked=true;
            }else{
               document.pkc.sub[3].checked=false;
            }
         }
         
         var chk=0;
         for(i=0; i<document.pkc.sub.length; i++){
            if(document.pkc.sub[i].checked){
               chk++;
            }
            if(chk==5){
               document.pkc.main.checked=true;
            }else{
               document.pkc.main.checked=false;
            }
         }
      }
      
      </script>
        <ul id="sub2">
          <li> 이용약관동의*&nbsp;&nbsp;&nbsp;<span>선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</span></li>
          <li> <input type="checkbox" name="main" onclick="main_chk()"> 전체동의</li>
          <li> <input type="checkbox" id="b1" onclick="sub_chk()" name="sub"> 이용약관(필수) 약관보기></li>
          <li> <input type="checkbox" id="b1" onclick="sub_chk()" name="sub"> 개인정보처리방침(필수) 약관보기></li>
          <li> <input type="checkbox" id="b1" onclick="sub_chk()" name="sub"> 개인정보처리방침(선택) 약관보기></li>
          <li> <input type="checkbox" id="b1" onclick="sub_chk()" name="sub"> 무료배송,할인쿠폰 등 혜택/정보 수신(선택)</li>
          <li>
             <input type="checkbox" id="b2" name="subsub" onclick="subsub_chk()"> SMS
             <input type="checkbox" id="b2" name="subsub" onclick="subsub_chk()"> 이메일
          </li>
          <li> <input type="checkbox" id="b1" onclick="sub_chk()" name="sub"> 보인은 만 14세 이상입니다.(필수)</li>
        </ul>
      </div>
      <p align="center"><input type="submit" value="가입하기"></p>
      </form>
   </div> <!-- id=main 태그의 끝 -->
</div>
<style>
  #fifth input[type=submit]{
    width:300px;
    height:50px;
    border-radius:3px;
    background: #5f0080;
   border:1px solid #5f0080;
   color:white;
  }
  #fifth #sub2 span{
     font-size:12px;
  }
  #fifth #sub2 li{
   list-style-type: none;
   height:35px;
  }
  #fifth #sub2 #b1{
     margin-left:40px;
  }
  #fifth #sub2 #b2{
     margin-left:65px;
  }
</style>  













