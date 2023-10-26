<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript" src="/js/jquery-1.8.3.min.js" ></script>

<script language="javascript">
function getAddr(){
	$.ajax({
		 url :"https://business.juso.go.kr/addrlink/addrCoordApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.entX+"</td>";
		htmlStr += "<td>"+this.entY+"</td>";
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
}
</script>
<title>Insert title here</title>
</head>
<body>
<form name="form" id="form" method="post">
	<input type="text" name="resultType" value="json"/> <!-- 요청 변수 설정 (검색결과형식 설정, json) --> 
	<input type="text" name="confmKey" value="TESTJUSOGOKR"/><!-- 요청 변수 설정 (승인키) -->
	<input type="text" name="admCd" value=""/> <!-- 요청 변수 설정 (행정구역코드) -->
	<input type="text" name="rnMgtSn" value=""/><!-- 요청 변수 설정 (도로명코드) --> 
	<input type="text" name="udrtYn" value=""/> <!-- 요청 변수 설정 (지하여부) -->
	<input type="text" name="buldMnnm" value=""/><!-- 요청 변수 설정 (건물본번) --> 
	<input type="text" name="buldSlno" value=""/><!-- 요청 변수 설정 (건물부번) -->
	<input type="button" onClick="getAddr();" value="좌표검색하기"/>
	<div id="list" ></div><!-- 검색 결과 리스트 출력 영역 -->
</form>
</body>
</html> 