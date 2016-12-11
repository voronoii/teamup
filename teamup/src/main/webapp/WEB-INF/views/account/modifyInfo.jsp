<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/layout.jsp"%>


<!doctype html>	



<style>


* {font-family:'Malgun Gothic'}
#outer, table {margin-left:30%; margin-top:2%; margin-bottom:2em; position: absolute; float:right;
		width:40em; 
		}
#inner {font-size : 2em;}
#save, #inner {display : inline;}
		
#myInfo {margin-top : 5%;}
#save {margin-left : 20em;}	

th, td { padding:1em; border-bottom: 1px solid #ddd;}
		
.odd {background-color : #ddd;}


</style>




<body>
<div id="outer">
	<div id="inner">회원정보 변경</div>
    <div id="save"><button type="submit"  onclick="send()"  style="display:inline" >저장</button></div>    
</div>

<table id="myInfo">
    <form id = "modifyFrm" action="/account/modifyInfo">
      <tr>
            <td rowspan="3" ><img src="../resources/images.png" ></td>
            <td width="100">이름</td>
            <td><input type="text" name = "name" value= "${memberVO.name}" ></td>            
        </tr>
        <tr>
        	<td>학교</td>
            <td><input type="text" name = "school" value= "${memberVO.school}" ></td>    
        </tr>  
         <tr>
        	<td>전공</td>
            <td><input type="text" name = "major" value= "${memberVO.major}" ></td>    
        </tr>   
    </form>
        <tr>            
            <td >&nbsp;</td>
            <td><button class="pure-button" onclick="updatePWD()">비밀번호 변경 </button></td>
            <td><button class="pure-button" onclick="deleteMem()">탈퇴하기 </button></td>
            
        </tr>    
        
        <tr>          	          
            <td colspan="3" class="odd">나의 포트폴리오 </td>                  
        </tr>    
        
        <tr>
        	<td colspan="2">${memberVO.portfolio}</td>
        	 <td ><button class="pure-button" value="photoreg" onclick="fileUpload()">등록</button>
                        
       </tr>
       
       <tr>
      	   <td colspan="3" class="odd">수상경력</td>
       
       </tr>
	   <tr>
  		  <td>수상명</td>
   		  <td >수상연도</td>
          <td><button onclick="prize()" >수정</button></td>
        </tr>        
        
        <c:forEach items="${list}" var="PrizeVO">
	    <tr>
	    
	      <td ><input type="text" value= "${PrizeVO.title}" disabled></td>  
	      <td ><input type="text" value="${PrizeVO.year}" disabled></td>
	      <td></td>
	    </tr>
	    </c:forEach>
        
</table>

</body>
<script>


function updatePWD(){
	
	location.href="/account/updatePasswd";
}

function prize(){
	window.open("prizeList","","width=460,height=500");
}

function fileUpload(){
	window.open("uploadForm","","width=460,height=250");
}

function deleteMem(){
	location.href="/account/withdraw";
}

function send(){
	$('#modifyFrm').attr("action", "/account/modifyInfo");
	$('#modifyFrm').attr("method", "post");
	$('#modifyFrm').submit(); 
	true;
}
</script>
