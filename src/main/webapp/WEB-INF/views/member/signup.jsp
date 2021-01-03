<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>webook 온라인서점</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/css/signup&in/signup&in.css" rel="stylesheet"> 
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>
<body id="LoginForm">

<div class="container">
<div class="login-form">
<div class="main-div">
   <div class="panel">
   	<h1><a href="/webook" class="webook-main">webook</a></h1>
   </div>
   <br>
    <form action="/member/signup" method="post" id="Login">
    
       <label>아이디</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userId">
       </div>

	   <label>비밀번호</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPass">
       </div>
       
       <label>비밀번호 재확인</label>
       <div class="form-group">
         <input type="password" class="form-control" name="userPassCheck">
       </div>
       
       <label>이름</label>
       <div class="form-group">
         <input type="text" class="form-control" name="userName">
       </div>
       
       <label>이메일</label>
       <div class="form-group">
         <input type="email" class="form-control" name="userEmail">
       </div>
       
       <label>전화번호</label>
       <div class="form-group">
         <input type="text" class="form-control" id="userPhon" name="userPhon">
       </div>
     
       <label>주소</label>
       <div class="form-group">
         <input type="text" class="form-control" id="sample4_postcode" name="postcode" placeholder="우편번호" style="width: 204px; important; display: inline; margin-bottom: 5px;">
         <input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width: 150px; important; display: inline; margin-bottom: 5px;"><br>
         <input type="text" class="form-control" name="userAddr1" id="sample4_roadAddress" placeholder="도로명주소" style="margin-bottom: 5px; important;" >
         <input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" style="margin-bottom: 5px; important;" >
         <span id="guide" style="color:#999;display:none"></span>
         <input type="text" class="form-control" name="userAddr2" id="sample4_detailAddress" placeholder="상세주소" style="width: 176px; important; display: inline; margin-bottom: 5px;">
         <input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목" style="width: 176px; important; display: inline; margin-left: 1px;">
       </div>
       <br>
       <input type="submit" value="가입하기" class="btn btn-primary">
    </form>
    </div>
	</div>
	</div>

<!-- 카카오 주소 API -->	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


// 카카오 주소 API
function sample4_execDaumPostcode() {
    new daum.Postcode({
         oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	

</body>
</html>