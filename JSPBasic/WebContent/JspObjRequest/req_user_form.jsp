<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		* 사용자의 입력값을 서버로 전송하는 방법
		1. 사용자의 입력 데이터를 서버로 전송하려면 HTML의 form태그를 사용합니다. 
		2. form 태그의 action 속성에 데이터를 전달받을 페이지의 URL주소를 적습니다. 
		3. input 태그의 name속성으로 요청 파라미터 변수명을 지정할 수 있습니다. 
	 --%>

   <h2>회원가입 양식</h2>
   <hr>

   <form action="req_user_info.jsp">
   	#이름 : <input type="text" name="name"/><br>
      # 아이디: <input type="text" name="id" /> <br>
      # 비밀번호: <input type="password" name="pw" /> <br>

      # 전공: <input type="radio" name="major" value="경영"/> 경영학과&nbsp;
             <input type="radio" name="major" value="화학"/> 화학과&nbsp;
             <input type="radio" name="major" value="물리"/> 물리학과&nbsp;
             <input type="radio" name="major" value="컴공"/> 컴퓨터공학 <br>

     
      # 취미: <input type="checkbox" name="hobby" value="독서" /> 독서&nbsp;
      <input type="checkbox" name="hobby" value="수면"/> 수면&nbsp;
      <input type="checkbox" name="hobby" value="축구"/> 축구&nbsp;
      <input type="checkbox" name="hobby" value="게임"/> 게임<br>

      # 지역:
      <select name="region">
         <option>서울</option>
         <option>대전</option>
         <option>대구</option>
         <option>부산</option>
      </select> <br>

     

      <input type="submit" value="확인"> &nbsp;
      <input type="reset" value="초기화">

   </form>


</body>
</html>